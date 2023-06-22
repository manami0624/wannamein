Rails.application.routes.draw do
  devise_for :users
  root to: "dialogs#index"
  resources :users, only: :show do
    resources :dialogs, only: [:index]
  end
  resources :dialogs do
    collection do
      get 'search'
      get 'work', to: 'dialogs#work', as: 'work'
      get 'daily', to: 'dialogs#daily', as: 'daily'
      get 'quotes', to: 'dialogs#quotes', as: 'quotes'
    end
  end
end
