Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: [:new, :create, :destroy, :update, :show, :edit]
  resources :relationships, only: [:create, :destroy]

  resources :users do
    member do
      get :following, :followers
    end
  end
  
  root 'recipes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
