module UsersHelper

  def is_admin?
    if current_user.is_admin == true
          return true
      else
          return false
      end
  end

end
