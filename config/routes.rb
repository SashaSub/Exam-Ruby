Rails.application.routes.draw do
  
  resources :orders
  resources :clients
  resources :products

  devise_for :users, controllers: { 
    sessions: 'users/sessions', 
    registrations: 'users/registrations' 
    }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "products#index"
end
