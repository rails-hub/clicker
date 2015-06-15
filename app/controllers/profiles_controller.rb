class ProfilesController < ApplicationController

  def edit
    @profile = current_user
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :email, :username, :password, :con)
  end

end
