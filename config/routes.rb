Rails.application.routes.draw do
  devise_for :users
  root to:"dialogs#index"
  resources :users, only: :show
  resources :dialogs do
    collection do
      get 'search'
    end
  end
  get '/users/:id/dialogs', to: 'users#dialogs', as: 'user_dialogs'
end
