class DialogsController < ApplicationController
  before_action :set_dialog, only: [:edit, :update]
  before_action :move_to_index, except: [:index, :search]

  def index
    if params[:category_id].present?
      @category = Category.find(params[:category_id])
      @dialogs = @category.dialogs
    else
      @dialogs = Dialog.all
    end

    def dialogs_by_category(category_id)
      Dialog.where(category_id: category_id)
    end
    @work_dialogs = dialogs_by_category(2)
    @daily_dialogs = dialogs_by_category(3)
    @quote_dialogs = dialogs_by_category(4)

    if params[:tag_ids]
      @dialogs = []
      params[:tag_ids].each do |key, value|
        @dialogs += Tag.find_by(name: key).dialogs if value == "1"
      end
      @dialogs.uniq!
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
    category_id = dialog.category_id  # 削除する投稿のカテゴリーIDを取得
    dialog.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: '投稿を削除しました。' }
      format.js
    end
  end
  
  def search
    @dialogs = Dialog.search(params[:keyword])
    keyword = params[:keyword].to_s.strip
    if keyword.empty?
      redirect_to root_path
    end
  end

  def category
    category_id = params[:category_id]
    @dialogs = Dialog.where(category_id: category_id)
  end

  def work
    @work_dialogs = Dialog.where(category_id: 2)
  end

  def daily
    @daily_dialogs = Dialog.where(category_id: 3)
  end

  def quotes
    @quotes_dialogs = Dialog.where(category_id: 4)
  end


  private
  def dialog_params
    params.require(:dialog).permit(:language, :translation, :memo, :category_id, :file, :body, tag_ids: []).merge(user_id: current_user.id)
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
