Rails.application.routes.draw do
  resources :references  
  resources :divisions
  resources :cargos
  resources :ubicacions
  resources :productos
  resources :linea_requesicions, only: [:index]
  resources :requesicions
  get 'ubicacionProveedores/:proveedor_id' , to: 'ubicacions#edit2', :as => 'editUbicacionesProveedor'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :proveedors
  get 'proveedors_user/:id/:usuario_id' , to: 'proveedors#show'
  # Defines the root path route ("/")
  # root "articles#index"
  resources :cotizacions, only: [:index]
  resources :linea_cotizacions, only: [:index]
  get 'cotizacions/:id', to: 'cotizacions#new'
  get 'cotizaciones', to: 'cotizacions#evaluar'
  get 'cotizaciones/:id', to: 'cotizacions#detalles'
  post 'guardar_cotizacion/:id', to: 'cotizacions#create'
  post 'guardar_linea_cotizacion', to: 'cotizacions#lineas_cotizacion'
  post 'aprobar_cotizacion', to: 'cotizacions#aprobar'
  


end
