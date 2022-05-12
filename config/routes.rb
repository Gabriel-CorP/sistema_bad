Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :proveedors
  get 'proveedors_user/:id/:usuario_id' , to: 'proveedors#show'
  # Defines the root path route ("/")
  # root "articles#index"
end
