module SnippetsHelper
  
  # check user have snippet's permission
  def has_permission(snippet)
    if @current_user
      if @current_user.id == @snippet.user_id or @current_user.admin
        return true
      end
    end
    
    return false
  end
end
