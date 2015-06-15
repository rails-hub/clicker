class Admin::UsersController < Admin::AdminsController
  skip_before_filter :is_admin, :only => [:update]

  def create
    user = User.new(user_params)
    if user.save
      flash[:notice] = "User Created Successfully."
      if type_params[:type] == "student"
        user.add_role :student
        redirect_to admin_students_path
      elsif type_params[:type] == "teacher"
        user.add_role :teacher
        redirect_to admin_teachers_path
      end
    else
      flash[:danger] = user.errors.full_messages
      if type_params[:type] == "student"
        redirect_to new_admin_student_path
      elsif type_params[:type] == "teacher"
        redirect_to new_admin_teacher_path
      end
    end
  end

  def update
    user = User.find(params[:id])
    user_update = user.update_attributes(user_params)
    if user_update
      flash[:notice] = "User Updated Successfully."
      if type_params[:type] == "student"
        redirect_to admin_students_path
      elsif type_params[:type] == "teacher"
        redirect_to admin_teachers_path
      else
        sign_in(:user, user)
        redirect_to edit_profile_path(user)
      end
    else
      flash[:danger] = user.errors.full_messages
      if type_params[:type] == "student"
        redirect_to new_admin_student_path
      elsif type_params[:type] == "teacher"
        redirect_to new_admin_teacher_path
      else
        sign_in(:user, user)
        redirect_to edit_profile_path(user)
      end
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :first_name, :last_name, :password_confirmation)
  end

  def type_params
    params.require(:user).permit(:type)
  end


end