class Admin::AdminsController < ApplicationController
  before_filter :is_admin

  def index
    @teachers = User.with_role(:teacher, :any)
    @students = User.with_role(:student, :any)
    @courses = Course.all
  end

end
