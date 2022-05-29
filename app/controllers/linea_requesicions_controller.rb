class LineaRequesicionsController < ApplicationController
  before_action :set_linea_requesicion, only: %i[ show edit update destroy ]

  # GET /linea_requesicions or /linea_requesicions.json
  def index
    @linea_requesicions = LineaRequesicion.all
  end

  # GET /linea_requesicions/1 or /linea_requesicions/1.json
  def show
  end

  # GET /linea_requesicions/new
  def new
    @linea_requesicion = LineaRequesicion.new
  end

  # GET /linea_requesicions/1/edit
  def edit
  end

  # POST /linea_requesicions or /linea_requesicions.json
  def create
    @linea_requesicion = LineaRequesicion.new(linea_requesicion_params)

    respond_to do |format|
      if @linea_requesicion.save
        format.html { redirect_to linea_requesicion_url(@linea_requesicion), notice: "Linea requesicion was successfully created." }
        format.json { render :show, status: :created, location: @linea_requesicion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @linea_requesicion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /linea_requesicions/1 or /linea_requesicions/1.json
  def update
    respond_to do |format|
      if @linea_requesicion.update(linea_requesicion_params)
        format.html { redirect_to linea_requesicion_url(@linea_requesicion), notice: "Linea requesicion was successfully updated." }
        format.json { render :show, status: :ok, location: @linea_requesicion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @linea_requesicion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /linea_requesicions/1 or /linea_requesicions/1.json
  def destroy
    @linea_requesicion.destroy

    respond_to do |format|
      format.html { redirect_to linea_requesicions_url, notice: "Linea requesicion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_linea_requesicion
      @linea_requesicion = LineaRequesicion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def linea_requesicion_params
      params.require(:producto_id, :cantidad)
    end
end
