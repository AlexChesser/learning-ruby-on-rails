Rails.application.routes.draw do
  resources :deliveries
  resources :users
  resources :countries
  resources :locales
  resources :roles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
