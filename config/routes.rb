Rails.application.routes.draw do
  resource :user
  resource :session, only: [:new, :create, :destroy]
  resources :products, only: [:show, :index] do
    collection { get :search }
  end
  root to: 'products#index'
  resources :users do
    get :confirm
  end

  namespace :admin do
    resources :products
    resources :categories
  end
end
