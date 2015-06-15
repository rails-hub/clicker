module CoursesHelper

  def can_create_course(user)
    if current_user.has_role? :teacher or current_user.has_role? :admin
      return true
    else
      return false
    end
  end

  def can_create_item(user)
    if current_user.has_role? :teacher or current_user.has_role? :admin
      return true
    else
      return false
    end
  end

end
