class DivisionsController < ApplicationController
    before_action :set_division, only: %i[ show edit update destroy ]

  # GET /division_administrativas or /division_administrativas.json
  def index
    @divisions = Division.all
    @proveedors = Proveedor.all

     
  end

  # GET /division_administrativas/1 or /division_administrativas/1.json
  def show
    @proveedor = Proveedor.find(@division.proveedor_id)
    @cargo = Cargo.find(@division.cargo_id)
  end

  # GET /division_administrativas/new
  def new
    @division = Division.new
    @proveedores=Proveedor.all
    @cargos=Cargo.all
  end

  # GET /division_administrativas/1/edit
  def edit
    @proveedores=Proveedor.all
    @cargos=Cargo.all
  end

  # POST /division_administrativas or /division_administrativas.json
  def create
    @division = Division.new(division_params)

    respond_to do |format|
      if @division.save
        format.html { redirect_to division_url(@division), notice: "Division administrativa a sido creada." }
        format.json { render :show, status: :created, location: @division }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @division.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /division_administrativas/1 or /division_administrativas/1.json
  def update
    respond_to do |format|
      if @division.update(division_params)
        format.html { redirect_to division_url(@division), notice: "Division administrativa a sido actualizada." }
        format.json { render :show, status: :ok, location: @division }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @division.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /division_administrativas/1 or /division_administrativas/1.json
  def destroy
    @division.destroy

    respond_to do |format|
      format.html { redirect_to divisions_url, notice: "Division administrativa a sido eliminada." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_division
      @division = Division.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def division_params
      params.require(:division).permit(:nombre_empleado, :proveedor_id, :cargo_id)
    end
end
