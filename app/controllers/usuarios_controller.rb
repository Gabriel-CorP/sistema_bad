class UsuariosController < ApplicationController
    before_action :set_usuario, only: %i[ show edit update destroy ]
    @ide=0
  # GET /usuarios or /usuarios.json
  def index
    @usuarios = Usuario.all
  end

  # GET /usuarios/1 or /usuarios/1.json
  def show
    
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
    @users=User.where.not(:id=>Usuario.pluck(:user))
    @rols=Rol.all
  end

  # GET /usuarios/1/edit
  def edit
    @users=User.where.not(:id=>Usuario.pluck(:user)).or(User.where(id:@usuario.user))
    @rols=Rol.all
    
  end

  # POST /usuarios or /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)
    @users=User.where.not(:id=>Usuario.pluck(:user))
    @rols=Rol.all
    @parametros=usuario_params
    puts(@parametros["rol_id"]=="1")
    #puts(@usuario[:id])
    respond_to do |format|
      if @usuario.save
        if @parametros["rol_id"]=="1"
            format.html { redirect_to proveedorNuevo_path(@usuario), notice: "Usuario was successfully created." }
            format.json { render :nuevoProveedor, status: :created, location: @usuario }
        else
        format.html { redirect_to usuario_url(@usuario), notice: "Usuario was successfully created." }
        format.json { render :show, status: :created, location: @usuario }
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios/1 or /usuarios/1.json
  def update
    @users=User.where.not(:id=>Usuario.pluck(:user)).or(User.where(id:@usuario.user))
    @rols=Rol.all
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to usuario_url(@usuario), notice: "Usuario was successfully updated." }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1 or /usuarios/1.json
  def destroy
    @usuario.destroy

    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: "Usuario was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def nuevoProveedor
    @id=params[:usuario_id]
    @proveedor = Proveedor.new
    @tiposProductos=TipoProducto.all()
    
    @usuarioNombre=(Usuario.find(@id)).nombre
    render :nuevoProveedor
  end

  def crearProveedor
    @proveedor = Proveedor.new(proveedor_params)
    #@usuario=Usuario.where(id: proveedor_params["usuario_id"])
    #puts(proveedor_params["usuario_id"])
    @id=proveedor_params["usuario_id"]
    @usuarioNombre=(Usuario.find(@id)).nombre
    @tiposProductos=TipoProducto.all()
      
      
      respond_to do |format|
        if @proveedor.save
          format.html { redirect_to nuevaUbicacion_path(@proveedor), notice: "El Proveedor a sido creado." }
          #format.json { render :show, status: :created, location: @proveedor }
        else
          format.html { render :nuevoProveedor, status: :unprocessable_entity,:locals => { :usuario => @usuario , :id => @id } }
          #format.json { render json: @proveedor.errors, status: :unprocessable_entity }
        end
      end
  end

  def nuevaUbicacion
    @id=params[:proveedor_id]
    @ubicacion=Ubicacion.new
    @proveedorNombre=(Proveedor.find(@id)).compania
    render :nuevaUbicacion
  end

  def crearUbicacion
    @ubicacion = Ubicacion.new(ubicacion_params)
    @parametros=ubicacion_params
    #@proveedors=Proveedor.all
    @proveedor=Proveedor.find(@parametros["proveedor_id"])
    @id=ubicacion_params["proveedor_id"]
    @proveedorNombre=(Proveedor.find(@id)).compania
    

    respond_to do |format|
      if @ubicacion.save
        format.html { redirect_to nuevaReferencia_path(@proveedor), notice: "Ubicacion was successfully created." }
        #format.json { render :show, status: :created, location: @ubicacion }
      else
        format.html { render :nuevaUbicacion, status: :unprocessable_entity ,:locals => {  :id => @id }}
        #format.json { render json: @ubicacion.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def nuevaReferencia
    puts(params)
    @id=params[:proveedor_id]
    @reference=Reference.new
    @proveedorNombre=(Proveedor.find(@id)).compania
    render :nuevaReferencia
  end

  def crearReferencia
    @reference = Reference.new(reference_params)
    @parametros=reference_params
    @proveedor=Proveedor.find(@parametros["proveedor_id"])
    @usuario=Usuario.find(@proveedor.usuario_id)
    @id=reference_params["proveedor_id"]
    @proveedorNombre=(Proveedor.find(@id)).compania
    respond_to do |format|
      if @reference.save
        format.html { redirect_to usuario_url(@usuario), notice: "Perfil de proveedor creado." }
        #format.json { render :show, status: :created, location: @reference }
      else
        format.html { render :nuevaReferencia, status: :unprocessable_entity,:locals => {  :id => @id } }
        #format.json { render json: @reference.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    def reference_params
        params.require(:reference).permit(:nombre_entidad, :nombre_contacto, :telefono_contacto, :proveedor_id)
    end

    def ubicacion_params
        params.require(:ubicacion).permit(:nombre, :direccion, :proveedor_id,:local,:mapa)
    end

    def proveedor_params
        params.require(:proveedor).permit(:compania, :representante_legal, :direccion, :telefono, :fax, :celular, :nombre_contacto, :web_site, :nrc, :anios, :rubro, :logo, :escritura_constitucion , :img_ubicacion_sucursales,:escritura, :usuario_id,:tipo_producto_id,ubicacions_attributes: [:nombre,:direccion,:local,:mapa])
        #params.require(:proveedor).permit(:compania, :representante_legal, :direccion, :telefono, :fax, :celular, :nombre_contacto, :web_site, :nrc, :anios, :rubro, :logo, :escritura_constitucion , :img_ubicacion_sucursales,:escritura, :usuario_id,escrituras:[])
      end

    # Only allow a list of trusted parameters through.
    def usuario_params
      params.require(:usuario).permit( :nombre, :apellido, :edad, :dui, :isss, :afp, :user, :rol_id)
    end
end
