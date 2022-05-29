class ReferencesController < ApplicationController
    before_action :set_reference, only: %i[ show edit update destroy ]

  # GET /referencia_proveedors or /referencia_proveedors.json
  def index
    @references = Reference.all
  end

  # GET /references/1 or /references/1.json
  def show
  end

  # GET /reference/new
  def new
    @reference = Reference.new
    @proveedors= Proveedor.all
  end

  # GET /referencia_proveedors/1/edit
  def edit
    @proveedors= Proveedor.all
  end

  # POST /referencia_proveedors or /referencia_proveedors.json
  def create
    @reference = Reference.new(reference_params)
    @proveedors= Proveedor.all
    respond_to do |format|
      if @reference.save
        format.html { redirect_to reference_url(@reference), notice: "La referencia al proveedor a sido creada." }
        format.json { render :show, status: :created, location: @reference }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /referencia_proveedors/1 or /referencia_proveedors/1.json
  def update
    @proveedors= Proveedor.all
    respond_to do |format|
      if @reference.update(reference_params)
        format.html { redirect_to reference_url(@reference), notice: "La referencia a sido actualizada." }
        format.json { render :show, status: :ok, location: @reference }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /referencia_proveedors/1 or /referencia_proveedors/1.json
  def destroy
    @reference.destroy

    respond_to do |format|
      format.html { redirect_to references_url, notice: "La referencia da sido eliminada" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reference
      @reference = Reference.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reference_params
      params.require(:reference).permit(:nombre_entidad, :nombre_contacto, :telefono_contacto, :proveedor_id)
    end
end
