require "md5"
# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  # return the formatted flash[:notice] html
  def notice_message(mark = :default, scroll = false)
    if !flash[mark]
      return ''
    end
    
    notice = flash[mark]
    flash[mark] = nil
    if notice[:notice_success]
      result = '<div id="success_message_'+mark.to_s+'" class="successMessage">'+notice[:notice_success]+'</div>'
    	if scroll == true
      	result += '<script type="text/javascript">
      	  $.scrollTo("#success_message_'+mark.to_s+'",200);</script>'
      end
    elsif notice[:notice_error]
      result = '<div id="error_explanation_'+mark.to_s+'" class="errorExplanation">'+notice[:notice_error]+'</div>'
    	if scroll == true
        result += '<script type="text/javascript">$.scrollTo("#error_explanation_'+mark.to_s+'",200);</script>'
      end
    else
      result = ''
    end
    
    return result
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

  # check user have model's permission
  def has_permission(item)
    if item.blank?
      return false
    end
    
    if !@current_user.blank?
      if @current_user.id == item.user_id or @current_user.admin
        return true
      end
    end
    
    return false
  end

  # format comment text
  def format_comment(comment)
    return auto_link(simple_format(html_escape(comment)))
  end
  
  # remove all space or break in HTML
  def spaceless(&block)
    data = capture(&block)
    data = data.gsub(/>\s+</,"><")
    concat(data)
  end
  
  
end
