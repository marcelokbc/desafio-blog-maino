Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  
  root "pages#home"

  namespace :admin do
    resources :dashboard, only: [:index]
    resources :posts, only: [:new, :create]
    resources :tags, only: [:new, :create]
  end

  resources :posts
  resources :user_comments, only: [:new, :create, :destroy]
end
