Rails.application.routes.draw do
  devise_for :users
  root to:"dialogs#index"
  resources :dialogs, only: :index
end
