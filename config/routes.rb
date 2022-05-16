Rails.application.routes.draw do
  resources :ubicacions
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :proveedors
  get 'proveedors_user/:id/:usuario_id' , to: 'proveedors#show'
  # Defines the root path route ("/")
  # root "articles#index"
  resources :cotizacions, only: [:index]
  get 'cotizacions/:id', to: 'cotizacions#new'
  post 'guardar_cotizacion/:id', to: 'cotizacions#create'
  post 'guardar_linea_cotizacion', to: 'lineacotizacions#create'

end
