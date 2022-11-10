require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users
  mount GrapeSwaggerRails::Engine => '/swagger'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "admin#index"

  get '/admin', to: "admin_panel#index", as: :admin
  
  scope module: 'admin', path: 'admin', as: 'admin' do
    resources :users, :orders, :products, :door_groups, :door_collections
  end
end
