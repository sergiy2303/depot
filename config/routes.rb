Rails.application.routes.draw do
  resource :user
  resource :session, only: [:new, :create, :destroy]
  root 'welcome#index'
  resources :users do
    get :confirm, on: :member
  end

  namespace :admin do
    resources :products
    resources :categories
  end
end
