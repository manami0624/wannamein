Rails.application.routes.draw do
  devise_for :users
  root to: "dialogs#index"
  resources :users, only: :show
  resources :dialogs do
    collection do
      get 'search'
    end
  end
  
  get '/work_dialogs', to: 'dialogs#work', as: 'work_dialogs'
  get '/daily_dialogs', to: 'dialogs#daily', as: 'daily_dialogs'
  get '/travel_dialogs', to: 'dialogs#travel', as: 'travel_dialogs'
  get '/quotes_dialogs', to: 'dialogs#quotes', as: 'quotes_dialogs'
  get '/users/:id/dialogs', to: 'users#dialogs', as: 'user_dialogs'
end