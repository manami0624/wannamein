Rails.application.routes.draw do
  devise_for :users
  root to:"dialogs#index"
  resources :dialogs do
    collection do
      get 'search'
    end
  end
end
