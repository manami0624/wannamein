class DialogsController < ApplicationController
  before_action :set_dialog, only: [:edit, :show, :update]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    def index
      if params[:category_id].present?
        @category = Category.find(params[:category_id])
        @dialogs = @category.dialogs
      else
        @dialogs = Dialog.all
      end
    end
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
    redirect_to root_path
  end

  def show
  end

  def search
    @dialogs = Dialog.search(params[:keyword])
  end

  def category
    category_id = params[:category_id]
    @dialogs = Dialog.where(category_id: category_id)
  end


  private
  def dialog_params
    params.require(:dialog).permit(:language, :translation, :memo, :category_id, :file).merge(user_id: current_user.id)
  end

  def set_dialog
    @dialog = Dialog.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
