class Admin::TeachersController < Admin::AdminsController

  def index
    @teachers = User.with_role(:teacher, :any).decorate
  end

  def new
    @teacher = User.new
  end

  def edit
    @teacher = User.find(params[:id])
  end

  def destroy
    @teacher = User.find(params[:id])
    @teacher.destroy
    flash[:success] = "Teacher Deleted Successfully"
    redirect_to admin_teachers_path
  end

  private

  def teacher_params
    params.require(:user).permit(:first_name,:last_name, :email, :username, :password, :con)
  end

end
