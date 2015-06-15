class CoursesController < ApplicationController

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def edit
    @course = Course.find(params[:id])
  end

  def add
    @course = Course.find(params[:id])
    render :json => UserCourse.create!(:user => current_user, :course => @course)
  end

  private

  def course_params
    params.require(:course).permit(:title, :courseId, :limit, :start_date, :end_date)
  end


end
