Rails.application.routes.draw do
  devise_for :users,
    controllers: { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  resources :recipes do
    member do
      post :add_to_shopping_list
      post :add_to_cookbook
      patch :publish
    end
    resources :recipe_ingredients, only: [:index, :create]
    resources :recipe_utensils, only: [:index, :create]
    resources :steps, only: [:index, :new, :create ]
    resources :reviews, only: [:create]
    resources :favorites, only: [:create]
    resources :cooked_recipe, only: [:create]
  end
  resources :steps, only: [:update, :edit]

  resources :planners, only: [:index, :create, :destroy]

  resources :shopping_lists, only: [:index, :new, :create, :show, :destroy] do
    resources :shopping_list_ingredients, only: [:create]
    member do
      delete :destroy_all
    end
  end
  resources :shopping_list_ingredients, only: [:destroy]

  resources :cookbooks do
    member do
      patch :publish
      patch :private
    end
    resources :cookbook_recipe, only: [:create]
    resources :followed_cookbooks, only: [:create]
  end

  resources :recipe_ingredients, only: [:destroy]
  resources :recipe_utensils, only: [:destroy]
  resources :steps, only: [:destroy]

  resources :favorites, only: [:destroy]
  resources :cooked_recipe, only: [:destroy]
  resources :cookbook_recipes, only: [:destroy]
  resources :followed_cookbooks, only: [:destroy]
  resources :ingredients
  resources :cooked_recipe, only: [:index]
  resources :followed_cookbooks, only: [:index]
  get "/users/:id", to: "users#show", as: :user
  get "/users/:id/edit", to: "users#edit", as: :user_edit
  patch "/users/:id", to: "users#update"


end
