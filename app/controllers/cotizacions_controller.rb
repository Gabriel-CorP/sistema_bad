class CotizacionsController < ApplicationController
  #  before_action :set_requesicion, only: [ :create ]
    def index
        @proveedor=Proveedor.find(1)
        @requesicions=Requesicion.where("estado= 'Pendiente' or estado= 'Cotizado'")

        @cotizaciones=Cotizacion.new
        @requesicions.each do |r|
           if r.estado="Cotizado"              
               @cotizaciones=Cotizacion.where(requesicion_id: r.id)
        
                           
           end
        end
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
        @productos=Array.new
        @pros=Array.new
        @provee= Proveedor.where(usuario_id:@reque.usuario_id)#aquí necesito el id del proveedor(usuario logeado)
        @lineas=LineaRequesicion.joins(:producto).where(requesicion_id: params[:id])
        @lineas.each do |linea|
            @pro=Producto.find(linea.producto_id)
            @productos.push(@pro)
        end
        @pros=@productos.uniq

    end
    def create
        puts(params[:id])
        puts(params[:descuentoefectivo])
        puts(params[:estado1])
        @requesicion=Requesicion.find(params[:id])
        @cotizacion= Cotizacion.new
        @cotizacion.requesicion_id=params[:id].to_i
        @cotizacion.proveedor_id=params[:proveedorid].to_i
        @cotizacion.descuento_efectivo=params[:descuentoefectivo].to_f
        @cotizacion.descuento_pronto_pago=params[:descuentoprontopago].to_f
        @cotizacion.descuento_volumen=params[:descuentovolumen].to_f
        @cotizacion.descuento_forma_pago=params[:descuentoformapago].to_f
        @cotizacion.envases_embalage=params[:envasesembalage].to_f
        @cotizacion.pago_transporte=params[:pagotransporte].to_f
        @cotizacion.recargo_aplazamiento=params[:recargoaplazamiento].to_f
        @cotizacion.estado=params[:estado1]
        @cotizacion.fecha_entrega=params[:fechaentrega]
        puts(@cotizacion.estado)
        @cotizacion.fecha_realizacion=Date.today
        @cotizacion.total=params[:total1].to_f
        puts(@cotizacion)
        
        #@cotizacion.save!
        result= {
            mensaje: "Cotizacion guardada"
        }
        respond_to do |format|
            if @cotizacion.save
                format.json { render json: result }
                @requesicion.estado="Cotizado"
                @requesicion.save!
                
            else
                format.json { render json: @cotizacion.errors.full_messages, status: :unprocessable_entity }
            end
        end     

    end
    def edit

    end
    
    def update

    end
    def destroy
    end

    def lineas_cotizacion
        @coti=Cotizacion.last
        @lineacotizacion=LineaCotizacion.new
        @lineacotizacion.linea_requesicion_id=params[:id]
        @lineacotizacion.cotizacion_id=@coti.id
        @lineacotizacion.precio_unitario=params[:preci].to_f
        @lineacotizacion.subtotal=params[:sub].to_f
        @lineacotizacion.save!
        puts(@lineacotizacion.subtotal)

        result= {
            mensaje: "Linea guardada"
        }
        respond_to do |format|
            if @lineacotizacion != nil
                format.json { render json: result }
            else
                format.json { render json: @lineacotizacion.errors.full_messages, status: :unprocessable_entity }
            end
        end

    end
 #   private
  #  def set_requesicion
   #     @requesicion = Requesicion.find(params[:id])
   # end
end
