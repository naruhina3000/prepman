Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'

  resources :recipes do
    resources :ingredients, only: [:index, :create, :update]
    resources :utensils, only: [:index, :create, :update]
    resources :steps, only: [:index, :new, :create, :edit, :update]
    resources :reviews, only: [:create]
    resources :planners, only: [:index, :create, :destroy]
    resources :favorites, only: [:create]
    resources :cooked_recipe, only: [:create]
    resources :cookbook_recipe, only: [:create]
  end

  resources :shopping_list, only: [:index, :create, :show, :destroy] do
    resources :shopping_list_ingredients, only: [:create, :destroy]
  end

  resources :favorites, only: [:destroy]
  resources :cooked_recipe, only: [:destroy]
  resources :cookbook_recipe, only: [:destroy]

  get "/users/:id", to: "users#show", as: :user
  get "/users/:id/edit", to: "users#edit", as: :user_edit
  patch "/users/:id", to: "users#update"

end
