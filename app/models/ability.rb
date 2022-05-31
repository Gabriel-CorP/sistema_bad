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
    
    
    if rol.rol == 'god_mode'
      can :manage, :all
    else
      can :read, :all

      #Aqui se validan todos los permisos a lo bestia
      RolPermiso.where(rol_id: Rol.find(Usuario.find_by(user_id:user.id).rol_id)).find_each do |permiso|
      
        case permiso.permiso_id
        #Cargo
        when 1
          can :create, Cargo
        when 2
          can :read, Cargo
        when 3
          can :update, Cargo
        when 4
          can :delete, Cargo
        #Cotizacion
        when 11
          can :create, Cotizacion
        when 12
          can :read, Cotizacion
        when 13
          can :update, Cotizacion
        when 14
          can :delete, Cotizacion
        #Division
        when 21
          can :create, Division
        when 22
          can :read, Division
        when 23
          can :update, Division
        when 24
          can :delete, Division
        #Evaluacion
        when 31
          can :create, Evaluacion
        when 32
          can :read, Evaluacion
        when 33
          can :update, Evaluacion
        when 34
          can :delete, Evaluacion
        #Linea_Cotizacion
        when 41
          can :create, LineaCotizacion
        when 42
          can :read, LineaCotizacion
        when 43
          can :update, LineaCotizacion
        when 44
          can :delete, LineaCotizacion
        #Linea_Requisicion
        when 51
          can :create, LineaRequesicion
        when 52
          can :read, LineaRequesicion
        when 53
          can :update, LineaRequesicion
        when 54
          can :delete, LineaRequesicion
        #Permiso
        when 61
          can :create, Permiso
        when 62
          can :read, Permiso
        when 63
          can :update, Permiso
        when 64
          can :delete, Permiso
        #Producto
        when 71
          can :create, Producto
        when 72
          can :read, Producto
        when 73
          can :update, Producto
        when 74
          can :delete, Producto
        #Proveedor
        when 81
          can :create, Proveedor
        when 82
          can :read, Proveedor
        when 83
          can :update, Proveedor
        when 84
          can :delete, Proveedor
        #Referencia
        when 91
          can :create, Referencia
        when 92
          can :read, Referencia
        when 93
          can :update, Referencia
        when 94
          can :delete, Referencia
        #Requisicion
        when 101
          can :create, Requisicion
        when 102
          can :read, Requisicion
        when 103
          can :update, Requisicion
        when 104
          can :delete, Requisicion
        #Rol
        when 111
          can :create, Rol
        when 112
          can :read, Rol
        when 113
          can :update, Rol
        when 114
          can :delete, Rol
        #Tipo_Producto
        when 121
          can :create, TipoProducto
        when 122
          can :read, TipoProducto
        when 123
          can :update, TipoProducto
        when 124
          can :delete, TipoProducto
        #Ubicacion
        when 131
          can :create, Ubicacion
        when 132
          can :read, Ubicacion
        when 133
          can :update, Ubicacion
        when 134
          can :delete, Ubicacion
        #Usuario
        when 141
          can :create, Usuario
        when 142
          can :read, Usuario
        when 143
          can :update, Usuario
        when 144
          can :delete, Usuario
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
