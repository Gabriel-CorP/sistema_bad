class RequesicionsController < ApplicationController
  before_action :set_requesicion, only: %i[ show edit update destroy ]

  # GET /requesicions or /requesicions.json
  def index
    # @requesicions = Requesicion.joins(:usuario).where(usuario_id:)
    @requesicions = Requesicion.all
  end

  # GET /requesicions/1 or /requesicions/1.json
  def show
    @usuario = Usuario.find(@requesicion.usuario_id)
  end

  # GET /requesicions/new
  def new
    @requesicion = Requesicion.new
    # @requesicion = Requesicion.create(usuario_id: 1)
    # @usuario = Usuario.where(usuario_id: usuario_id)
    # redirect_to edit_requesicion_path(@requesicion)
  end

  # GET /requesicions/1/edit
  def edit
    @productos_requesicion = @requesicion.linea_requesicions
  end

  # POST /requesicions or /requesicions.json
  def create
    @requesicion = Requesicion.new
    @requesicion.fecha_entrega=params[:fechaentrega]
    @requesicion.prioridad=params[:prioridad]
    @requesicion.estado=params[:estado]
    @requesicion.observacion=params[:observacion]
    @requesicion.fecha_solicitud=Date.today

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_requesicion
      @requesicion = Requesicion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def requesicion_params
      params.require(:requesicion).permit(:fecha_entrega, :fecha_solicitud, :prioridad, :usuario_id, :estado, :observacion)
    end
end
