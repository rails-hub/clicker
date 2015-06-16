class Admin::AttendancesController < Admin::AdminsController
  skip_before_filter :is_admin
  before_filter :is_admin_or_teacher
  before_filter :course_and_item

  def edit
    @attendance = Attendance.find(params[:id])
    @user_courses = @course.user_courses
    @user_attendances = @attendance.user_attendances
  end

  def update
    @attendance = Attendance.find(params[:id])
    @user_attendance = UserAttendance.where('interactive_item_id = ? and user_id = ? and attendance_id = ?', attendance_params[:interactive_item_id], attendance_params[:user_id], @attendance.id)
    if @user_attendance.blank?
      @user_attendance = UserAttendance.create(attendance_params)
    else
      if present_params[:checked] == "false"
        @user_attendance.first.destroy
      end
    end
    render :json => {:status => 200}
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to admin_courses_path
  end

  private

  def attendance_params
    params.permit(:interactive_item_id, :user_id, :attendance_id)
  end

  def present_params
    params.permit(:checked)
  end

  def course_and_item
    @course = Course.find(params[:course_id])
    @item = InteractiveItem.find(params[:interactive_item_id])

  end
end
