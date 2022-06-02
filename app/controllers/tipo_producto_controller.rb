class TipoProductoController < ApplicationController
  def index
    @allTipos = TipoProducto.all

  end

  def show
  end

  def destroy
    @destroyTipo = TipoProducto.find(params[:id])
    @destroyTipo.destroy
    redirect_to "/tipo_producto"
  end

  def new 
  end

  def create
  
    @newTipo = TipoProducto.new(nombre: params[:nombre])
    @newTipo.save
    redirect_to "/tipo_producto"
  
  end

end
