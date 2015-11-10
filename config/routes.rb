Rails.application.routes.draw do
  resource :user
  resource :session, only: [:new, :create, :destroy]
  root 'welcome#index'
  resources :users do
    member do
      get :confirm_email
    end
  end
end
