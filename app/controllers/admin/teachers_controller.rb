class Admin::TeachersController < Admin::AdminsController

  def index
    @teachers = User.with_role(:teacher, :any).decorate
  end

  def edit

  end

  def destroy

  end


end
