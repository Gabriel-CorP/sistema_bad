class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #

    #Se traeran los permisos, dependiendo de los permisos, se les dará acceso
    user ||= User.new # guest user (not logged in)
    usuario = Usuario.find_by(user_id:user.id)
  if(usuario != nil)
    rol = Rol.find(usuario.rol_id)
    
    
    if rol.rol == 'administrador'
      can :manage, :all
    else
 
      #Aqui se validan todos los permisos a lo bestia
      RolPermiso.where(rol_id: Rol.find(Usuario.find_by(user_id:user.id).rol_id)).find_each do |permiso|
      
        case permiso.permiso_id
        #Cargo
        when 1
          can :create, Cargo
          can :read, Cargo
        when 2
          can :read, Cargo
        when 3
          can :update, Cargo
          can :read, Cargo
        when 4
          can :delete, Cargo
          can :read, Cargo
        #Cotizacion
        when 11
          can :create, Cotizacion
          can :read, Cotizacion
        when 12
          can :read, Cotizacion
        when 13
          can :update, Cotizacion
          can :read, Cotizacion
        when 14
          can :delete, Cotizacion
          can :read, Cotizacion
        #Division
        when 21
          can :create, Division
          can :read, Division
        when 22
          can :read, Division
        when 23
          can :update, Division
          can :read, Division
        when 24
          can :delete, Division
          can :read, Division
        #Evaluacion
        when 31
          can :create, Evaluacion
          can :read, Evaluacion
        when 32
          can :read, Evaluacion
        when 33
          can :update, Evaluacion
          can :read, Evaluacion
        when 34
          can :delete, Evaluacion
          can :read, Evaluacion
        #Linea_Cotizacion
        when 41
          can :create, LineaCotizacion
          can :read, LineaCotizacion
        when 42
          can :read, LineaCotizacion
        when 43
          can :update, LineaCotizacion
          can :read, LineaCotizacion
        when 44
          can :delete, LineaCotizacion
          can :read, LineaCotizacion
        #Linea_Requisicion
        when 51
          can :create, LineaRequesicion
          can :read, LineaRequesicion
        when 52
          can :read, LineaRequesicion
        when 53
          can :update, LineaRequesicion
          can :read, LineaRequesicion
        when 54
          can :delete, LineaRequesicion
          can :read, LineaRequesicion
        #Permiso
        when 61
          can :create, Permiso
          can :read, Permiso
        when 62
          can :read, Permiso
        when 63
          can :update, Permiso
          can :read, Permiso
        when 64
          can :delete, Permiso
          can :read, Permiso
        #Producto
        when 71
          can :create, Producto
          can :read, Producto
        when 72
          can :read, Producto
        when 73
          can :update, Producto
          can :read, Producto
        when 74
          can :delete, Producto
          can :read, Producto
        #Proveedor
        when 81
          can :create, Proveedor
          can :read, Proveedor
        when 82
          can :read, Proveedor
        when 83
          can :update, Proveedor
          can :read, Proveedor
        when 84
          can :delete, Proveedor
          can :read, Proveedor
        #Referencia
        when 91
          can :create, Reference
          can :read, Reference
        when 92
          can :read, Reference
        when 93
          can :update, Reference
          can :read, Reference
        when 94
          can :delete, Reference
          can :read, Reference
        #Requisicion
        when 101
          can :create, Requesicion
          can :read, Requesicion
        when 102
          can :read, Requesicion
        when 103
          can :update, Requesicion
          can :read, Requesicion
        when 104
          can :delete, Requesicion
          can :read, Requesicion
        #Rol
        when 111
          can :create, Rol
          can :read, Rol
        when 112
          can :read, Rol
        when 113
          can :update, Rol
          can :read, Rol
        when 114
          can :delete, Rol
          can :read, Rol
        #Tipo_Producto
        when 121
          can :create, TipoProducto
          can :read, TipoProducto
        when 122
          can :read, TipoProducto
        when 123
          can :update, TipoProducto
          can :read, TipoProducto
        when 124
          can :delete, TipoProducto
          can :read, TipoProducto
        #Ubicacion
        when 131
          can :create, Ubicacion
          can :read, Ubicacion
        when 132
          can :read, Ubicacion
        when 133
          can :update, Ubicacion
          can :read, Ubicacion
        when 134
          can :delete, Ubicacion
          can :read, Ubicacion
        #Usuario
        when 141
          can :create, Usuario
          can :read, Usuario
        when 142
          can :read, Usuario
        when 143
          can :update, Usuario
          can :read, Usuario
        when 144
          can :delete, Usuario
          can :read, Usuario
        end

      end
      #Aqui se acaba 


    end 

  else

    cannot :manage, :all
  
  end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
