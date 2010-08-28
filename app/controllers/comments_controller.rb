# coding: utf-8  
class CommentsController < ApplicationController
	before_filter :require_admin
	
  # GET /comments
  # GET /comments.xml
  def index
    @comments = Comment.paginate(:page => params[:page],:per_page => 10,:order => "id desc")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end
  
  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(comments_url) }
      format.xml  { head :ok }
    end
  end
end
