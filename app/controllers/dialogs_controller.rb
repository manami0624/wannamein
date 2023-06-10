class DialogsController < ApplicationController
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

  private

  def dialog_params
    params.require(:dialog).permit(:language, :translation, :category_id, :file)
  end
end
