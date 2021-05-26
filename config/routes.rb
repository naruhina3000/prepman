Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'

  resources :recipes do
    member do
      post :add_to_shopping_list
      patch :publish
    end
    resources :recipe_ingredients, only: [:index, :create]
    resources :recipe_utensils, only: [:index, :create]
    resources :steps, only: [:index, :new, :create ]
    resources :reviews, only: [:create]
    resources :favorites, only: [:create]
    resources :cooked_recipe, only: [:create]
    resources :cookbook_recipe, only: [:create]
  end
  resources :steps, only: [:update, :edit]

  resources :planners, only: [:index, :create, :destroy]

  resources :shopping_lists, only: [:index, :new, :create, :show, :destroy] do
    resources :shopping_list_ingredients, only: [:create]
  end
  resources :shopping_list_ingredients, only: [:destroy]
  resources :recipe_ingredients, only: [:destroy]
  resources :recipe_utensils, only: [:destroy]
  resources :steps, only: [:destroy]

  resources :favorites, only: [:destroy]
  resources :cooked_recipe, only: [:destroy]
  resources :cookbook_recipe, only: [:destroy]
  resources :ingredients
  get "/users/:id", to: "users#show", as: :user
  get "/users/:id/edit", to: "users#edit", as: :user_edit
  patch "/users/:id", to: "users#update"

end
