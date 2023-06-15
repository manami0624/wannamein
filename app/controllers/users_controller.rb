class UsersController < ApplicationController
  def show
    @name = current_user.name
    @dialogs = current_user.dialogs
  end

  def dialogs
    @user = User.find(params[:id])
    @dialogs = @user.dialogs
  end
end
