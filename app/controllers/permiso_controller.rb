class PermisoController < ApplicationController
  def index

  end

  def show
    @rol = Rol.find(params[:id])
    @permisos = RolPermiso.all.where(rol_id: @rol.id)
    @allPermisos = Permiso.all
  end

  def create
    
    @aray = params
    @rol = Rol.find(@aray[:idRol])
    @permisos = RolPermiso.all.where(rol_id: @rol.id)
    @allPermisos = Permiso.all

    @permisos.each do |permis|
      RolPermiso.find(permis.id).destroy
    end
    
    @allPermisos.each do |permis|
      if(@aray[permis.id.to_s] == "1")
        @newRolPermiso = RolPermiso.new(rol_id: @rol.id, permiso_id: permis.id)
        @newRolPermiso.save
      end

    
    end
    
    redirect_to "/rol/" + @rol.id.to_s
  end



end
