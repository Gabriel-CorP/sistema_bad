class CotizacionsController < ApplicationController
  #  before_action :set_requesicion, only: [ :create ]
    def index
        @proveedor=Proveedor.find(1)
        @requesicions=Requesicion.where("estado= 'Pendiente' or estado= 'Cotizado'")

        @cotizaciones=Cotizacion.new
        @requesicions.each do |r|
           if r.estado=="Cotizado"              
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
    def evaluar
        @requesiciones=Requesicion.where("estado='Cotizado'")
        
    end
    def detalles
        sql="SELECT c.proveedor_id, c.descuento_efectivo,
        c.descuento_pronto_pago, c.descuento_volumen,
        c.descuento_forma_pago, c.envases_embalage, c.pago_transporte,
        c.recargo_aplazamiento, c.fecha_entrega, c.total, 
        pro.compania, c.id FROM cotizacions AS c INNER JOIN requesicions AS r
        INNER JOIN proveedors AS pro
        WHERE c.requesicion_id=" + params[:id] 
        @array = ActiveRecord::Base.connection.execute(sql).to_a
        @cotizaciones= Cotizacion.where(requesicion_id: params[:id] )
        @requesicion=Requesicion.find(params[:id])
        @productos=Array.new
        @detallesCotizaciones=Array.new
        @detallesRequesicion=LineaRequesicion.where(requesicion_id: params[:id])
        @detallesRequesicion.each do |linea|
            @pro=Producto.find(linea.producto_id)
            @productos.push(@pro)
        end
        @pros=@productos.uniq #eliminando productos repetidos
        @cotizaciones.each do |c| #buscando los detalles de las cotizaciones
            @lineac= LineaCotizacion.where(cotizacion_id: c.id)
            @lineac.each do |l|
                @detallesCotizaciones.push(l)
            end
            
        end
        

    end
    def aprobar
        @usuario_logeado="gabrielcorena@gmail.com"
        @cotizacion="smart watch 5 pulg 10 unidades \n smart TV 55 pulg 10 unidades "
        #recibir todos los datos de la cotizacion y crear una cadena o algo así :v para enviarlo
#creando el email
        PostMailer.with(user: @usuario_logeado, contenido: @cotizacion).post_created.deliver_later

    end 

 #   private
  #  def set_requesicion
   #     @requesicion = Requesicion.find(params[:id])
   # end
end
