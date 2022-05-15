class CotizacionsController < ApplicationController
    def index
        @requesicions=Requesicion.where(estado: 'Pendiente')
      #  @reques=Requesicion.joins(:usuario).where(usuario_id:)
    end

    def show
        @cotizacion=new
        
        #@proveedor= Proveedor.find(usuario_id: usuario.id)
        @lineas=LineaRequesicion.joins(:producto).where(requesicion_id: params[:id])
        
    end

    def new
        @cotizacion=Cotizacion.new
        @reque=Requesicion.find(params[:id])
        puts(@reque.usuario_id.to_s)
        @provee= Proveedor.where(usuario_id:@reque.usuario_id)
        @lineas=LineaRequesicion.joins(:producto).where(requesicion_id: params[:id])
        

    end
    def create
        
        @cotizacion= Cotizacion.create(params.require(:cotizacion).permit(:proveedor, :descuento_efectivo, :descuento_pronto_pago, :descuento_volumen, :descuento_forma_pago, :envases_embalage, :pago_transporte, :recargo_aplazamiento, :estado , :total, :fecha_realizacion, :fecha_entrega ))
    end
    def edit

    end
    
    def update

    end
    def destroy
    end
end
