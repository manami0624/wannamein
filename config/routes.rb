Rails.application.routes.draw do
  get 'dialogs/index'
  root to:"dialogs#index"
end
