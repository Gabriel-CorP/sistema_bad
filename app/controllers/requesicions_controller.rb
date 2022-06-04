class RequesicionsController < ApplicationController
  before_action :set_requesicion, only: %i[ show edit update destroy agregar_producto ]
  before_action :authenticate_user!
  protect_from_forgery unless: -> { request.format.json? }

  # GET /requesicions or /requesicions.json
  def index
    @usuario = Usuario.find_by(user_id:current_user)
    @requesicions = Requesicion.joins(:usuario).where(usuario_id:@usuario)
    #@requesicions = Requesicion.all
  end

  def observacion
    @requesicion=Requesicion.find(params[:id])
    @productos_requesicion = @requesicion.linea_requesicions
  end

  # GET /requesicions/1 or /requesicions/1.json
  def show
    @usuario = Usuario.find_by(user_id:current_user)
    @productos_requesicion = @requesicion.linea_requesicions
  end

  # GET /requesicions/new
  def new
    # @requesicion = Requesicion.new
    @usuario = Usuario.find_by(user_id:current_user)
    @requesicion = Requesicion.create(usuario_id:@usuario.id, prioridad:'Media', estado:'Pendiente', fecha_solicitud:Date.current, fecha_entrega:Date.current+10.days)
    redirect_to edit_requesicion_path(@requesicion)
  end

  # GET /requesicions/1/edit
  def edit
    @productos_requesicion = @requesicion.linea_requesicions
  end

  # POST /requesicions or /requesicions.json
  def create
    @requesicion = Requesicion.new
    @requesicion.fecha_entrega=params[:fecha_entrega]
    @requesicion.prioridad=params[:prioridad]
    @requesicion.estado=params[:estado]
    @requesicion.observacion=params[:observacion]
    
    respond_to do |format|
      if @requesicion.save
        format.html { redirect_to requesicion_url(@requesicion), notice: "Requisicion creada." }
        format.json { render :show, status: :created, location: @requesicion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @requesicion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requesicions/1 or /requesicions/1.json
  def update
    respond_to do |format|
      if @requesicion.update(requesicion_params)
        format.html { redirect_to requesicion_url(@requesicion), notice: "Requisicion modificada." }
        format.json { render :show, status: :ok, location: @requesicion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @requesicion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requesicions/1 or /requesicions/1.json
  def destroy
    @requesicion.destroy

    respond_to do |format|
      format.html { redirect_to requesicions_url, notice: "Requisicion eliminada." }
      format.json { head :no_content }
    end
  end

  def agregar_producto
    producto = Producto.find(params[:producto_id])
    cantidad = params[:cantidad].nil? ? 1 : params[:cantidad].to_i
    @linea_requesicion = @requesicion.linea_requesicions.build(producto_id: producto.id, cantidad: cantidad)
    result = {
      producto_id: @linea_requesicion.producto_id,
      nombre_producto: @linea_requesicion.producto.try(:nombre),
      cantidad: @linea_requesicion.cantidad
    }

    respond_to do |format|
      if @requesicion.save && producto.save
        format.json{ render json: result }
      else
        format.json{ render json: @requesicion.errors.full_messages, status: :unprocessable_entitys }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_requesicion
      @requesicion = Requesicion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def requesicion_params
      params.require(:requesicion).permit(:fecha_entrega, :fecha_solicitud, :prioridad, :usuario_id, :estado, :observacion, :linea_requesicions)
    end
end
