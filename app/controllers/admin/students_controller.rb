class Admin::StudentsController < Admin::AdminsController

  def index
    @students = User.with_role(:student, :any).decorate
  end

  def edit

  end

  def destroy

  end

end
