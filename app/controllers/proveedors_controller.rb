class ProveedorsController < ApplicationController
    before_action :set_proveedor, only: %i[ show edit update destroy ]
    
    # GET /proveedors or /proveedors.json
    def index
      @proveedors = Proveedor.all
    end
    def reporte
      @cantidad_proveedores=Proveedor.count
      #@proveedor_mas_longevo=Proveedor.maximum(:anios)
      #proveedores por años de relacion
      @anios_count = Proveedor.group(:compania).sum(:anios)
      #proveedores por tipo de producto
      @tiposProducto_count =Proveedor.joins(:tipo_producto).group(" tipo_productos.nombre").select("tipo_productos.*, count(proveedors.id) as cuenta_proveedores").collect{|x| [x.nombre, x.cuenta_proveedores]}
      #Cantidad de hubiaciones por proveedor
      @ubicacionesProveedor_count =Proveedor.joins(:ubicacions).group(" proveedors.compania").select("proveedors.*, count(ubicacions.id) as cuenta_ubicaciones").collect{|x| [x.compania, x.cuenta_ubicaciones]}
      #cantidad de cotizaciones a proveedores
      @cotizaciones_proveedores_count=Proveedor.joins(:cotizacions).group("proveedors.compania").select("cotizacions.*, count(proveedors.id) as cuenta_cotizaciones_proveedores").collect{|x| [x.compania, x.cuenta_cotizaciones_proveedores]}

      render :reporte
    end
    # GET /proveedors/1 or /proveedors/1.json
    def show
        @usuario = Usuario.find(@proveedor.usuario_id)
        @TipoProducto=TipoProducto.find(@proveedor.tipo_producto_id)
    end
  
    # GET /proveedors/new
    def new
      if(can? :create, :all)
        @proveedor = Proveedor.new
      #2.times {@proveedor.ubicacions.build}
      #@proveedor.ubicacions.build
       #filtrando para que los proveedores que ya estan en la tabla proveedores no salgan en el combo box
        @usuario=Usuario.where(rol_id: 1).merge(Usuario.where.not(:id=>Proveedor.pluck(:usuario_id)))
        @tiposProductos=TipoProducto.all()
      else
        redirect_to "/ubicacions"
      end
    end
  
    # GET /proveedors/1/edit
    def edit
        #@usuario = Usuario.find(@proveedor.usuario_id)
        #@usuario=Usuario.where.not(rol_id: 1).or(Usuario.where(id:@proveedor.usuario_id))#mas adelante filtrar mas si se necesita distinguir q no tenga otro rol de momento 1 es proveedor
        @usuario=Usuario.where(rol_id: 1).merge(Usuario.where.not(:id=>Proveedor.pluck(:usuario_id))).or(Usuario.where(id:@proveedor.usuario_id))
        puts(@usuario)
        @tiposProductos=TipoProducto.all()
    end

    
  
    # POST /proveedors or /proveedors.json
    def create
      @proveedor = Proveedor.new(proveedor_params)
      @usuario=Usuario.where(rol_id: 1).merge(Usuario.where.not(:id=>Proveedor.pluck(:usuario_id))).or(Usuario.where(id:@proveedor.usuario_id))
      @tiposProductos=TipoProducto.all()
      respond_to do |format|
        if @proveedor.save
          format.html { redirect_to proveedor_url(@proveedor), notice: "El Proveedor a sido creado." }
          format.json { render :show, status: :created, location: @proveedor }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @proveedor.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /proveedors/1 or /proveedors/1.json
    def update
      @usuario=Usuario.where(rol_id: 1).merge(Usuario.where.not(:id=>Proveedor.pluck(:usuario_id))).or(Usuario.where(id:@proveedor.usuario_id))
      @tiposProductos=TipoProducto.all()
      respond_to do |format|
        if @proveedor.update(proveedor_params)
          format.html { redirect_to proveedor_url(@proveedor), notice: "Proveedor actualizado correctamente." }
          format.json { render :show, status: :ok, location: @proveedor }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @proveedor.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /proveedors/1 or /proveedors/1.json
    def destroy
      @proveedor.destroy
      
      respond_to do |format|
        format.html { redirect_to proveedors_url, notice: "Proveedor was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    def nuevo
      
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_proveedor
        @proveedor = Proveedor.find(params[:id])
      end
      
  
      # Only allow a list of trusted parameters through.
      def proveedor_params
        params.require(:proveedor).permit(:compania, :representante_legal, :direccion, :telefono, :fax, :celular, :nombre_contacto, :web_site, :nrc, :anios, :rubro, :logo, :escritura_constitucion , :img_ubicacion_sucursales,:escritura, :usuario_id,:tipo_producto_id,ubicacions_attributes: [:nombre,:direccion,:local,:mapa])
        #params.require(:proveedor).permit(:compania, :representante_legal, :direccion, :telefono, :fax, :celular, :nombre_contacto, :web_site, :nrc, :anios, :rubro, :logo, :escritura_constitucion , :img_ubicacion_sucursales,:escritura, :usuario_id,escrituras:[])
      end
  end
  