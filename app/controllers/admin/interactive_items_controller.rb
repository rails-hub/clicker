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
    @course = Course.find(params[:course_id])
    @item = InteractiveItem.find(params[:id])
  end

  def create
    @course = Course.find(params[:course_id])
    klass = item_params[:interactable_type].capitalize.to_s.constantize
    item = InteractiveItem.new.build_item(item_params[:interactable_type].capitalize, klass, current_user, item_params, @course)
    if item.save
      interactable = InteractiveItem.new(course: @course, user: current_user, interactable: item, for_date: item_params[:for_date])
      if interactable.save
        item.update_attribute('interactive_item_id', interactable.id)
        redirect_to edit_admin_course_interactive_item_attendance_path(interactive_item_id: interactable.id, :id => item.id) if item_params[:interactable_type].capitalize === "Attendance"
        redirect_to edit_admin_course_interactive_item_quiz_path(interactive_item_id: interactable.id, :id => item.id) if item_params[:interactable_type].capitalize === "Quiz"
        redirect_to edit_admin_course_interactive_item_poll_path(interactive_item_id: interactable.id, :id => item.id) if item_params[:interactable_type].capitalize === "Poll"
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
    @course = Course.find(params[:course_id])
    @item = InteractiveItem.find(params[:id])
    update_item = item_update()
    if update_item
      @item.update_attribute('for_date', item_params[:for_date])
      flash[:success] = "Interactive Item Updated Successfully"
      redirect_to edit_admin_course_interactive_item_attendance_path(interactive_item_id: @item.id, id: @item.interactable_id) if @item.interactable_type === "Attendance"
      redirect_to edit_admin_course_interactive_item_quiz_path(interactive_item_id: @item.id, id: @item.interactable_id) if @item.interactable_type=== "Quiz"
      redirect_to edit_admin_course_interactive_item_poll_path(interactive_item_id: @item.id, id: @item.interactable_id) if @item.interactable_type === "Poll"

    else
      flash[:danger] = @item.errors.full_messages
      redirect_to admin_course_interactive_items_path
    end
  end

  def destroy
    @item = InteractiveItem.find(params[:id])
    @item.destroy
    flash[:success] = "Deleted Successfully"
    redirect_to admin_course_interactive_items_path
  end

  private

  def item_update
    if @item.interactable_type === "Attendance"
      return true
    end
    @item.interactable.update_attributes(send("#{@item.interactable_type.downcase}_params"))
  end

  def item_params
    params.require(:interactive_item).permit(:interactable_id, :interactable_type, :for_date, :type, :title, :time_limit)
  end

  def quiz_params
    params.require(:interactive_item).permit(:title, :time_limit)
  end

  def poll_params
    params.require(:interactive_item).permit(:title)
  end

end
