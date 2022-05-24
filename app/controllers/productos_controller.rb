class ProductosController < ApplicationController
  before_action :set_producto, only: %i[ show edit update destroy ]

  # GET /productos or /productos.json
  def index
    @productos = Producto.all
  end

  # GET /productos/1 or /productos/1.json
  def show
    @tipo_producto = TipoProducto.find(@producto.tipo_producto_id)
  end

  # GET /productos/new
  def new
    @producto = Producto.new
    @tipo_producto = TipoProducto.all
  end

  # GET /productos/1/edit
  def edit
    @tipo_producto = TipoProducto.all
  end

  # POST /productos or /productos.json
  def create
    @producto = Producto.new(producto_params)
    @tipo_producto = TipoProducto.all
    respond_to do |format|
      if @producto.save
        format.html { redirect_to producto_url(@producto), notice: "Producto creado." }
        format.json { render :show, status: :created, location: @producto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /productos/1 or /productos/1.json
  def update
    respond_to do |format|
      if @producto.update(producto_params)
        format.html { redirect_to producto_url(@producto), notice: "Producto modificado." }
        format.json { render :show, status: :ok, location: @producto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productos/1 or /productos/1.json
  def destroy
    @producto.destroy

    respond_to do |format|
      format.html { redirect_to productos_url, notice: "Producto eliminado." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_producto
      @producto = Producto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def producto_params
      params.require(:producto).permit(:imagen, :nombre, :descripcion, :presentacion, :precio, :existencias, :tipo_producto_id)
    end
end
