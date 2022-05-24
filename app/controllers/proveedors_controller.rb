class ProveedorsController < ApplicationController
    before_action :set_proveedor, only: %i[ show edit update destroy ]
    
    # GET /proveedors or /proveedors.json
    def index
      @proveedors = Proveedor.all
    end
  
    # GET /proveedors/1 or /proveedors/1.json
    def show
        @usuario = Usuario.find(@proveedor.usuario_id)
        @TipoProducto=TipoProducto.find(@proveedor.tipo_producto_id)
    end
  
    # GET /proveedors/new
    def new
      @proveedor = Proveedor.new
      #2.times {@proveedor.ubicacions.build}
      #@proveedor.ubicacions.build
       #filtrando para que los proveedores que ya estan en la tabla proveedores no salgan en el combo box
      @usuario=Usuario.where(rol_id: 1).merge(Usuario.where.not(:id=>Proveedor.pluck(:usuario_id)))
      @tiposProductos=TipoProducto.all()
    end
  
    # GET /proveedors/1/edit
    def edit
        #@usuario = Usuario.find(@proveedor.usuario_id)
        #@usuario=Usuario.where.not(rol_id: 1).or(Usuario.where(id:@proveedor.usuario_id))#mas adelante filtrar mas si se necesita distinguir q no tenga otro rol de momento 1 es proveedor
        @usuario=Usuario.where(rol_id: 1).merge(Usuario.where.not(:id=>Proveedor.pluck(:usuario_id))).merge(Usuario.where(id:@proveedor.usuario_id))
        @tiposProductos=TipoProducto.all()
    end

    
  
    # POST /proveedors or /proveedors.json
    def create
      @proveedor = Proveedor.new(proveedor_params)
      @usuario=Usuario.where.not(rol_id: 1).or(Usuario.where(id:@proveedor.usuario_id))
      
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
  