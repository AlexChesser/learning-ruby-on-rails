require 'karafka/web'
Rails.application.routes.draw do
  resources :events
  mount Karafka::Web::App, at: '/karafka'
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :invoices
  resources :deliveries
  resources :users
  resources :roles
  resources :locales
  resources :countries
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'users/:id/deliveries', to: 'users#show_deliveries'
end
