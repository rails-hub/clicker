class Admin::InteractiveItemsController < Admin::AdminsController
  skip_before_filter :is_admin
  before_filter :is_admin_or_teacher

  def index
    @course = Course.find(params[:course_id])
    @items = InteractiveItem.all.where('course_id = ?', @course.id)
  end

  def new
    @course = Course.find(params[:course_id])
    @item = InteractiveItem.new
  end

  def edit
    @item = InteractiveItem.find(params[:id])
  end

  def create
    @course = Course.find(params[:course_id])
    klass = item_params[:interactable_type].capitalize.to_s.constantize
    item = klass.new(course: @course, user: current_user)
    if item.save
      interactable = InteractiveItem.new(course: @course, user: current_user, interactable: item, for_date: item_params[:for_date])
      if interactable.save
        item.update_attribute('interactive_item_id', interactable.id)
        redirect_to new_admin_course_interactive_item_attendance_path(interactive_item_id: interactable.id) if item_params[:interactable_type].capitalize === "Attendance"
        redirect_to new_admin_course_interactive_item_quiz_path(interactive_item_id: interactable.id) if item_params[:interactable_type].capitalize === "Quiz"
        redirect_to new_admin_course_interactive_item_poll_path(interactive_item_id: interactable.id) if item_params[:interactable_type].capitalize === "Poll"
      else
        interactable.destroy
        flash[:danger] = interactable.errors.full_messages
        redirect_to new_admin_courses_interactive_item_path
      end
    else
      flash[:danger] = item.errors.full_messages
      redirect_to new_admin_course_interactive_item_path
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

  def item_params
    params.require(:interactive_item).permit(:interactable_id, :interactable_type, :for_date, :type, :title)
  end

end
