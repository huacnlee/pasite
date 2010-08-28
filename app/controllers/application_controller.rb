# coding: utf-8  
# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  # Scrub sensitive parameters from your log
  before_filter :init_filter

  def init_filter
  	check_login	
  	
  	if not /user\/register|user\/login|user\/logout/.match(request.env["HTTP_REFERER"])
      session[:referer] = request.env["HTTP_REFERER"] 
    end	
  end

  def redirect_back(default)
    redirect_to(session[:referer] || default)
    session[:referer] = nil
  end
  
  # 输出404错误
  def render_404
    render_optional_error_file(404)
  end
  
  # 设置SEO 的Meta 值
  def set_seo_meta(title,keywords = '',desc = '')
    if title
      @page_title =  "#{title} &raquo; Pasite"
    else
      @page_title = "Pasite"
    end
    @meta_keywords = keywords
    @meta_description = desc
  end
  
  def require_login
    if not @current_user
      redirect_to :controller => "home", :action => "login"
      return false
    end
    return true
  end
  
  def require_admin
    if not @is_admin
      redirect_to :controller => "home", :action => "login"
      return false
    end
    return true
  end

  # save flash notice
  def save_notice(notice,error = false,mark = :default)
    flash[mark] = {}
    if error
      flash[mark][:notice_error] = notice
    else
      flash[mark][:notice_success] = notice  
    end    
  end

  # save error message in flash
  def error_notice(notice,mark = :default)
    save_notice(notice,true,mark)
  end
  
  # save success message in flash
  def success_notice(notice,mark = :default)
    save_notice(notice,false,mark)
  end

  def save_login(user)
    session[:user_id] = user.id
    @current_user = User.find_by_id(session[:user_id])    
  end

  def clear_login
    @current_user = nil
    session[:user_id] = nil
    @is_admin = nil
  end
  
  def check_login
    @current_user = User.find_by_id(session[:user_id])    
    if @current_user
      if @current_user.admin
        @is_admin = true
      end
    end
  end
end
