class Admin::StudentsController < Admin::AdminsController

  def index
    @students = User.with_role(:student, :any).decorate
  end

  def new
    @student = User.new
  end

  def edit
    @student = User.find(params[:id])
  end


  def destroy
    @student = User.find(params[:id])
    @student.destroy
    flash[:success] = "Student Deleted Successfully"
    redirect_to admin_students_path
  end

  private

  def student_params
    params.require(:user).permit(:first_name,:last_name, :email, :username, :password, :con)
  end

end
