require "md5"
# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  # return the formatted flash[:notice] html
  def success_messages
    if flash[:notice]
      '
      <div id="successMessage" class="successMessage">
    		'+flash[:notice]+'
    	</div>
      '
    else
      ''
    end
  end

  # form auth token
  def auth_token
    "<input name=\"authenticity_token\" type=\"hidden\" value=\"#{form_authenticity_token}\" />"
  end
  
  # return the Gravatar face by Email
  def face_url(email,size=128)
    hash = MD5::md5(email)
    "http://www.gravatar.com/avatar/#{hash}?s=#{size}"
  end
  
  # check user have snippet's permission
  def has_permission(snippet)
    if @current_user
      if @current_user.id == @snippet.user_id or @current_user.admin
        return true
      end
    end
    
    return false
  end
	
	# format comment text
	def format_comment(comment)
		return auto_link(simple_format(html_escape(comment)))
	end
end
