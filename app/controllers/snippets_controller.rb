# coding: utf-8  
class SnippetsController < ApplicationController
  # GET /snippets
  # GET /snippets.xml
  before_filter :require_login, :only => [:edit,:update,:destroy]
  before_filter :init_sidebar, :only => [:index, :search]
  validates_captcha
  
  private
  def init_sidebar
    @top_languages = Language.find_top      
    if not @user
      @top_users = User.find_top_by_snippets_count
      @recent_comments = Comment.snippet_recent(5)
    end
  end
  
  public
  def index 
    @sub_title = ""
    @snippets_count = 0
    if params[:lang]
      @language = Language.find_by_slug(params[:lang])
      if @language
        @snippets = @language.snippets.find_page(params[:page])
        @snippets_count = @language.snippets.count
        @sub_title = "Listing snippets in #{@language.name} language"
        @feed_title = "#{@language.name}"
        set_seo_meta("Snippets &raquo; #{@language.name} language")
      end
    elsif params[:tag]          
      @snippets = Snippet.tagged_with(params[:tag],:on => :tags).find_page(params[:page])
      @snippets_count = Snippet.tagged_with(params[:tag],:on => :tags).count(:select => "*")
      @sub_title = "Listing #{params[:tag]} snippets"
      @feed_title = "#{params[:tag]}"
      set_seo_meta("Snippets &raquo; Taged #{params[:tag]}")
    elsif params[:login]
      @user = User.find_by_login(params[:login])
      if @user
        @snippets = @user.snippets.find_page(params[:page])
        @snippets_count = @user.snippets_count
        @sub_title = "Listing #{@user.name}'s snippets"
        @feed_title = "#{@user.name}'s snippets"
        set_seo_meta("#{@user.name}'s snippets")
      end
    else
      @snippets = Snippet.find_page(params[:page])
      @snippets_count = Snippet.count
      @sub_title = "Listing snippets"
      @feed_title = "Recent snippets"
      set_seo_meta(nil)
    end   
    
    if params[:type] == "feed"
      # Set the content type to the standard one for RSS
      response.headers['Content-Type'] = 'application/rss+xml'
        render "rss" , :layout => false
    else
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @snippets }
      end
    end
  end

  # GET /snippets/1
  # GET /snippets/1.xml
  def show
    @snippet = Snippet.find(params[:id],:include => [:user,:tags,:comments])
    @snippet.update_views_count
            
    # theme
    @theme_name = "idle"
    if params[:theme]
      if APP_THEMES.index(params[:theme])
        @theme_name = params[:theme]
        session[:theme_name] = @theme_name
      end
    else
      if session[:theme_name]
        @theme_name = session[:theme_name]
      end
    end
    
    if @snippet.private
      return if not require_login
      if not(@current_user.id == @snippet.user_id or @current_user.admin)
        render_404
        return
      end
    end
    
    if request.post?
      pcomment = params[:comment]

      @comment = @snippet.comments.new(:title => pcomment[:title],:user => @current_user,:comment => pcomment[:comment])       
      if !captcha_validated? and !@current_user
        @comment.errors.add("captcha","不正确，请检查")    
        render :action => "show",:archor => "comments"
      else
        
        if @comment.save
          success_notice('Comment successfully created.', :comments)
          redirect_to snippet_path(params[:id],:anchor => "comments")
        else
          render :action => "show",:archor => "comments"
        end     
      end
    else            
      @comment = @snippet.comments.new
      set_seo_meta("##{@snippet.id} #{@snippet.title}")

      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @snippet }
        format.raw { render :raw => @snippet }
        format.code { render :code => @snippet }
      end
    end
  end
    
  # GET /snippets/new
  # GET /snippets/new.xml
  def new
    @snippet = Snippet.new
    set_seo_meta("New snippet")
    respond_to do |format|
      format.html { render :action => "edit" } # new.html.erb
      format.xml  { render :xml => @snippet }
    end
  end

  # GET /snippets/1/edit
  def edit
    @snippet = Snippet.find(params[:id])
    set_seo_meta("Edit snippet")
  end

  # POST /snippets
  # POST /snippets.xml
  def create
    @snippet = Snippet.new(params[:snippet])
    if @current_user
      @snippet.user_id = @current_user.id
    else
      if !captcha_validated?
        @snippet.errors.add("captcha","不正确，请检查")       
      end
      @snippet.user_id = nil
    end
    
    if @snippet.errors.size > 0
      render :action => "edit"
    else
      respond_to do |format|
        if @snippet.save
          success_notice('Snippet was successfully created.')
          format.html { redirect_to(@snippet) }
          format.xml  { render :xml => @snippet, :status => :created, :location => @snippet }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @snippet.errors, :status => :unprocessable_entity }
        end
      end
    end

    
  end

  # PUT /snippets/1
  # PUT /snippets/1.xml
  def update
    @snippet = Snippet.find(params[:id])
        
    respond_to do |format|
      if @snippet.update_attributes(params[:snippet])
        success_notice('Snippet was successfully updated.')
        format.html { redirect_to(@snippet) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @snippet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /snippets/1
  # DELETE /snippets/1.xml
  def destroy
    @snippet = Snippet.find(params[:id])
    @snippet.destroy
    success_notice("Snippet was deleted.")

    respond_to do |format|
      format.html { redirect_to(snippets_url) }
      format.xml  { head :ok }
    end
  end
  
  def search
    if !@current_user
      error_notice("Sorry, currently only allows registered users to use search function, <br />
      you can register and sign in before using this feature.")
      redirect_to register_path
      return
    end
    
    if params[:s].blank?
      redirect_to snippets_path
      return
    end
    
    @snippets = Snippet.search(params[:s].split("\s"),
            :page => params[:page],
            :per_page => 8,
            :include => [:user,:language])    
    @snippets_count = @snippets.count
    @sub_title = "Search snippets by \"#{params[:s]}\""
    render :action => "index"
  end
end
