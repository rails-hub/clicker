class CourseDecorator < Draper::Decorator
  delegate_all

  def my_course(user)
    if  user.user_courses.detect { |c| c.course_id == self.id }
      return true
    else
      return false
    end
  end
end
