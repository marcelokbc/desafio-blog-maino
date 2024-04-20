Rails.application.routes.draw do
  devise_for :users
  root "pages#home"

  namespace :admin do
    resources :dashboard, only: [:index]
    resources :posts
  end

  resources :posts
  resources :user_comments, only: [:new, :create, :destroy]
end
