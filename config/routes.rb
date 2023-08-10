Rails.application.routes.draw do
  resources :foods, only: [:index, :new, :create]
  resources :recipes do 
    resources :recipe_foods, as: 'foods'
    member do
      patch 'toggle_public'
    end
  end
  resources :foods, only: [:index, :new, :create, :destroy]
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :public_recipes  
  post 'toggle_public', to: 'recipes#toggle'
  # Defines the root path route ("/")
  root to: 'users#index'
  get '/general_shopping_list', to: 'shopping_list#index'
end
