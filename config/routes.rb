Rails.application.routes.draw do
  get 'no_user/index'
  get 'tipo_producto/index'
  get 'permiso/index'
  get 'rol/index'
  
  devise_for :views
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }
  resources :no_user
  resources :tipo_producto
  resources :permiso
  resources :rol
  resources :error404
  resources :usuarios
  resources :references  
  resources :divisions
  resources :cargos
  resources :ubicacions
  get 'ubicacionProveedores/:proveedor_id' , to: 'ubicacions#edit2', :as => 'editUbicacionesProveedor'#sin uso
  get 'proveedor/:usuario_id' , to:'usuarios#nuevoProveedor' , :as => 'proveedorNuevo'
  post 'crearProveedor' , to:'usuarios#crearProveedor',:as =>'crearProveedor'
  get 'ubicacion/:proveedor_id' , to:'usuarios#nuevaUbicacion',:as =>'nuevaUbicacion'
  post 'crearUbicacion' , to:'usuarios#crearUbicacion',:as =>'crearUbicacion'
  get 'referencia/:proveedor_id' , to:'usuarios#nuevaReferencia',:as =>'nuevaReferencia'
  post 'crearReferencia' , to:'usuarios#crearReferencia',:as =>'crearReferencia'
  get 'proveedores/reporte' , to:'proveedors#reporte', :as => 'reporteProveedores'




  
  resources :productos
  resources :linea_requesicions, only: [:index]
  resources :requesicions
  get 'buscador_productos/:criterio', to: 'productos#buscador'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :proveedors
  get 'proveedors_user/:id/:usuario_id' , to: 'proveedors#show'
  # Defines the root path route ("/")
  # root "articles#index"
  resources :cotizacions, only: [:index]
  resources :linea_cotizacions, only: [:index]
  get 'cotizaciones/:id', to: 'cotizacions#new'
  get 'cotizaciones', to: 'cotizacions#evaluar'
  get 'cotizaciones_proveeedor', to: 'cotizacions#index'
  get 'cotizaciones/:id', to: 'cotizacions#detalles'
  post 'guardar_cotizacion/:id', to: 'cotizacions#create'
  post 'guardar_linea_cotizacion', to: 'cotizacions#lineas_cotizacion'
  post 'aprobar_cotizacion', to: 'cotizacions#aprobar'
  
  get 'reporte/prod_ordenados', to: 'reporg#productos_ordenados'      #reporte por productos ordenados
  get 'reporte/compras_categorias', to: 'reporg#compras_categorias'   #Reporte de montos de compra por categorias


  resources :login
  get 'login/index', to: 'login#index'

end
