class DialogsController < ApplicationController
  def index
    @dialogs = Dialog.all
  end

  def new
  end
end
