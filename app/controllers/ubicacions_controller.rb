class UbicacionsController < ApplicationController
  before_action :set_ubicacion, only: %i[ show edit update destroy ]

  # GET /ubicacions or /ubicacions.json
  def index
    @ubicacions = Ubicacion.all
  end

  # GET /ubicacions/1 or /ubicacions/1.json
  def show
  end

  # GET /ubicacions/new
  def new
    @ubicacion = Ubicacion.new
  end

  # GET /ubicacions/1/edit
  def edit
  end

  # POST /ubicacions or /ubicacions.json
  def create
    @ubicacion = Ubicacion.new(ubicacion_params)

    respond_to do |format|
      if @ubicacion.save
        format.html { redirect_to ubicacion_url(@ubicacion), notice: "Ubicacion was successfully created." }
        format.json { render :show, status: :created, location: @ubicacion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ubicacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ubicacions/1 or /ubicacions/1.json
  def update
    respond_to do |format|
      if @ubicacion.update(ubicacion_params)
        format.html { redirect_to ubicacion_url(@ubicacion), notice: "Ubicacion was successfully updated." }
        format.json { render :show, status: :ok, location: @ubicacion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ubicacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ubicacions/1 or /ubicacions/1.json
  def destroy
    @ubicacion.destroy

    respond_to do |format|
      format.html { redirect_to ubicacions_url, notice: "Ubicacion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ubicacion
      @ubicacion = Ubicacion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ubicacion_params
      params.require(:ubicacion).permit(:nombre, :direccion, :proveedor_id)
    end
end
