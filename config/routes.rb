Rails.application.routes.draw do
  resources :order_items
  resources :items
  resources :stocks
  resources :orders
  resources :medicines
  resources :medstores
  resources :manufactors
  resources :distributors
  resources :authentication
  resources :users 
  post 'authenticate', to: 'authentication#authenticate'
  get '/getorders/:distributors_id', to: 'orders#getorder'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
