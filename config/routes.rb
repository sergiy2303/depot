Rails.application.routes.draw do
  resource :user
  resource :session, only: [:new, :create, :destroy]
  root 'welcome#index'
  get 'user/confirmation', to: 'users#confirmation'
end
