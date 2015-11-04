Rails.application.routes.draw do
  resource :user
  resource :session, only: [:new, :create, :destroy]
  root 'welcome#index'
end
