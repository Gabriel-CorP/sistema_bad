Rails.application.routes.draw do
  resources :references
  resources :divisions
  resources :cargos
  resources :ubicacions
  get 'ubicacionProveedores/:proveedor_id' , to: 'ubicacions#edit2', :as => 'editUbicacionesProveedor'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :proveedors
  get 'proveedors_user/:id/:usuario_id' , to: 'proveedors#show'
  # Defines the root path route ("/")
  # root "articles#index"
  resources :cotizacions, only: [:index]
  get 'cotizacions/:id', to: 'cotizacions#new'
end
