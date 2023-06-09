class DialogsController < ApplicationController
  def index
    @dialogs = Dialog.all
  end
end
