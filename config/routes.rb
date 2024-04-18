Rails.application.routes.draw do
  devise_for :users
  root "pages#home"

  namespace :admin do
    resources :dashboard, only: [:index]
    resources :posts
  end

  resources :posts, only: [:index, :show]
end
