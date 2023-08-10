Rails.application.routes.draw do
  resources :foods, only: [:index, :new, :create]
  resources :recipes do 
    resources :recipe_foods, as: 'foods'
  end
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  devise_for :users
  resources :general_shopping_lists, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :public_recipes  
  post 'toggle_public', to: 'recipes#toggle'
  # Defines the root path route ("/")
  root to: 'users#index'
end
