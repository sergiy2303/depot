Rails.application.routes.draw do
  resource :user
  resource :session, only: [:new, :create, :destroy]
  resources :products, only: [:show]
  resources :orders, only: [:show, :destroy] do
    patch ':id', to: :create, as: :cart, on: :collection
  end

  root 'products#index'
  get 'categories/(:slug)', to: 'products#index', as: :categories
  resources :users do
    get :confirm, on: :member
  end

  namespace :admin do
    resources :products
    resources :categories
  end
end
