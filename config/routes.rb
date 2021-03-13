Rails.application.routes.draw do
  devise_for :users
  resources :recipes
  resources :users, only: [:show]
  root 'recipes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
