class Admin::QuizzesController < Admin::AdminsController
  skip_before_filter :is_admin
  before_filter :is_admin_or_teacher
  before_filter :course_and_item

  def index
  end

  def new
    @attendance = Attendance.new
  end

  def edit
    @attendance = Attendance.find(params[:id])
  end

  def create
    attendance =  Attendance.new(course: @course, user: current_user, for_date: attendance_params[:interactive_items][:attendance][:for_date])
    if attendance.save
      flash[:success] = "Attendance Created Successfully"
      redirect_to admin_courses_interactive_items_path
    else
      flash[:danger] = attendance.errors.full_messages
      redirect_to new_admin_course_interactive_items_attendance_path
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

  def attendance_params
    params.require(:course).permit(:interactive_items => [:attendance => [:for_date]])
  end

  def course_and_item
    @course = Course.find(params[:course_id])
    @item = InteractiveItem.find(params[:interactive_item_id])

  end
end
