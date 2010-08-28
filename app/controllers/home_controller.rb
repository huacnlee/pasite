class HomeController < ApplicationController
	before_filter :require_login, :only => [:settings]
	validates_captcha
	
	def register		
		@user = User.new
		
		if params[:user]
			@user = User.new(params[:user])
            passwd_unencoded = @user.passwd
			@user.passwd = User.encode(@user.passwd)
			if @user.save
				success_notice("Register successed.")
                # send regist successed mail to user Email
                Mailer.regist_successed(@user,passwd_unencoded)
				save_login(@user)
				redirect_to "/"
				return
			end
		end
		set_seo_meta("Register")
		render :action => "register"
		
	end
	
	# login
  def login
    @user = User.new
    
    if params[:user]
      if !captcha_validated?
        flash[:errors] = "Captcha not match."        
      else
        @user = User.check_login(params[:user][:email], User.encode(params[:user][:passwd]))
              
        if @user
          save_login(@user)
          redirect_to "/"
          return
        else
          @user = User.new
          flash[:errors] = "Invalid login name/email or password."
        end
      end
    end
    
		set_seo_meta("Login")
    render :action => "login"
  end
	
	def logout
		clear_login
		redirect_to "/"
	end
	
	def settings
		@user = @current_user		
		if params[:_method] == 'put'
			p = params[:user]
			p[:admin] = @user.admin
			if @user.update_attributes(p)
        success_notice('User was successfully updated.')
        redirect_to :controller => "home", :action => "settings"
      else
        render :action => "settings"
      end
		end
	end
	
	def password
		if params[:_method] == 'put'
		  logger.debug { "#{params[:old_passwd]}" }
      if @current_user.update_passwd(params[:old_passwd], params[:new_passwd], params[:confirm_passwd])
        success_notice("Password changed.")
        redirect_to :action => "password"
      end
    end
	end

	def help
		set_seo_meta("Help")
	end
  
  def links
    set_seo_meta("Links")
  end
end
