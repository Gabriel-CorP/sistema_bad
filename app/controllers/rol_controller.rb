class RolController < ApplicationController
  def index
    @roles = Rol.all
  end

  def show
    @rol = Rol.find(params[:id])
    @permisos = RolPermiso.all.where(rol_id: @rol.id)
    @allPermisos = Permiso.all
  end

  def new
    @allPermisos = Permiso.all
    
  end

  def create
  
    @newRol = Rol.new(rol: params[:nombreRol])
    @allPermisos = Permiso.all
    if @newRol.save
      @allPermisos.each do |permis|
        if(params[permis.id.to_s] == "1")
          @newRolPermiso = RolPermiso.new(rol_id: @newRol.id, permiso_id: permis.id)
          @newRolPermiso.save
        end
  
      
      end

      redirect_to @newRol
    else

      
      render :new
    end
  
  end

  def destroy
    @rol = Rol.find(params[:id])
    @permisos = RolPermiso.all.where(rol_id: @rol.id)
    @permisos.each do |permiso|
    
      RolPermiso.find(permiso.id).destroy
    
    end

    
    @rol.destroy
    flash[:success] = "El rol ha sido eliminado."
    redirect_to "/rol"

  end


end
