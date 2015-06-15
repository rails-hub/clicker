class Admin::CoursesController < Admin::AdminsController
  skip_before_filter :is_admin
  before_filter :is_admin_or_teacher

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def edit
    @course = Course.find(params[:id])
  end

  def create
    @course = current_user.courses.build(course_params)
    if @course.save
      flash[:success] = "Course Create Successfully"
      redirect_to admin_courses_path
    else
      flash[:danger] = @course.errors.full_messages
      redirect_to new_admin_course_path
    end
  end

  def update
    @course = Course.find(params[:id])
    if @course.update_attributes(course_params)
      flash[:success] = "Course Updated Successfully"
      redirect_to admin_courses_path
    else
      flash[:danger] = @course.errors.full_messages
      redirect_to edit_admin_course_path
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to admin_courses_path
  end

  private

  def course_params
    params.require(:course).permit(:title, :courseId, :limit, :start_date, :end_date)
  end

end
