Rails.application.routes.draw do
  resources :purchases
  resources :users
  resources :products
  root 'products#index'
  get '/cart' , to: 'purchases#cart'
  get '/login', to: 'users#login', as: :login
  post '/sign_out', to: 'users#sign_out', as: :sign_out
  post '/sign_in', to: 'users#sign_in', as: :sign_in
  post '/sign_up', to: 'users#sign_up', as: :sign_up
  post '/add_to_cart/:id',  to: 'purchases#add_to_cart', as: :add_to_cart
  post '/change_quantity/:id', to: 'purchases#change_quantity', as: :change_quantity
  post '/finish_order', to: 'purchases#finish_order', as: :finish_order
  post '/search', to: 'products#search', as: :search
  #get '/search', to: 'products#search', as: :search
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
