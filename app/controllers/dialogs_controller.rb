class DialogsController < ApplicationController
  before_action :set_dialog, only: [:edit, :show, :update]
  def index
    @dialogs = Dialog.all
  end

  def new
    @dialog = Dialog.new
  end

  def create
    @dialog = Dialog.new(dialog_params)
    if @dialog.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @dialog.update(dialog_params)
      redirect_to root_path
    end
  end

  def destroy
    dialog = Dialog.find(params[:id])
    dialog.destroy
  end

  def show
  end


  private
  def dialog_params
    params.require(:dialog).permit(:language, :translation, :memo, :category_id, :file).merge(user_id: current_user.id)
  end

  def set_dialog
    @dialog = Dialog.find(params[:id])
  end
end
