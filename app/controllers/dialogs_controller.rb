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
      redirect_to dialogs_path, notice: '投稿が保存されました。'
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @dialog = Dialog.find(params[:id])
    if @dialog.destroy
      redirect_to root_path
    end
  end

  def show
    @dialog = Dialog.find(params[:id])
  end


  private
  def dialog_params
    params.require(:dialog).permit(:language, :translation, :memo, :category_id, :file).merge(user_id: current_user.id)
  end
end
