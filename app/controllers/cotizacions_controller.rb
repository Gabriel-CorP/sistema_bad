class CotizacionsController < ApplicationController
  #  before_action :set_requesicion, only: [ :create ]
  before_action :authenticate_user!
    def index
        @usuario=Usuario.find_by(user_id: current_user.id)
        @proveedor=Proveedor.find_by(usuario_id: @usuario.id)
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
        @usuario=Usuario.find_by(user_id: current_user.id)
        puts(@usuario.id.to_s + "usuario")
        @proveedor=Proveedor.where(usuario_id: @usuario.id)#aquí necesito el id del proveedor(usuario logeado)
        puts(@proveedor[0].id)
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
                @requesicion.save
                
            else
                format.json { render json: @cotizacion.errors.full_messages, status: :unprocessable_entity }
            end
        end     

    end

    def lineas_cotizacion
        
        @coti=Cotizacion.last
        @lineacotizacion=LineaCotizacion.new
        @lineacotizacion.linea_requesicion_id=params[:id]
        @lineacotizacion.cotizacion_id=@coti.id
        @lineacotizacion.precio_unitario=params[:preci].to_f
        @lineacotizacion.subtotal=params[:sub].to_f
        @lineacotizacion.save
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
        if (can? :update, Cotizacion)
        @requesiciones=Requesicion.where("estado='Cotizado'")
        else
            redirect_to action: :index
        end
        
    end
    def detalles
        sql="SELECT c.proveedor_id, c.descuento_efectivo,
        c.descuento_pronto_pago, c.descuento_volumen,
        c.descuento_forma_pago, c.envases_embalage, c.pago_transporte,
        c.recargo_aplazamiento, c.fecha_entrega, c.total, 
        pro.compania, c.id FROM cotizacions AS c INNER JOIN requesicions AS r
        INNER JOIN proveedors AS pro
        WHERE pro.id=c.proveedor_id 
        AND  c.requesicion_id= r.id
        AND c.requesicion_id=" + params[:id] 
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
        @coti=Cotizacion.find(params[:id])
        @reque=Requesicion.find(@coti.requesicion_id)
        @productos=Array.new
        @cotizacionText="Estimado proveedor hemos aprobado su cotización con los siguientes detalles:\n
        Descuento por pago en efectivo (%)= #{@coti.descuento_efectivo.to_s}\n
        Descuento por pronto pago (%)= #{@coti.descuento_pronto_pago.to_s} \n
        Descuento por volumen de venta (%)= #{@coti.descuento_volumen.to_s} \n
        Descuento por forma de pago (%)= #{@coti.descuento_forma_pago.to_s} \n
        Pago por envases y embalage ($)= #{@coti.envases_embalage.to_s} \n
        Pago de transporte ($)= #{@coti.pago_transporte.to_s} \n
        recargo por aplazamiento de pago ($)= #{@coti.recargo_aplazamiento.to_s} \n
        fecha de entrega = #{@coti.fecha_entrega.to_s} \n
        Total ($)= #{@coti.total}\n"+"
        Producto \t\tCantidad \t\tPrecio \t\tSubtotal\n"

        @provee= Proveedor.find(@coti.proveedor_id)#aquí necesito el id del proveedor(usuario logeado)
        @lineasR=LineaRequesicion.where(requesicion_id: @reque.id)
        @lineasR.each do |linea|
            @pro=Producto.find(linea.producto_id)
            @productos.push(@pro)
        end
        @detalle=""
        @lineasC=LineaCotizacion.where(cotizacion_id: @coti.id)
        @lineasC.each do |lc|
            @lineasR.each do |lr|
                if lc.linea_requesicion_id == lr.id
                    @pro=Producto.find(lr.producto_id)
                    @detalle="\t#{@pro.nombre} #{@pro.presentacion} \t\t#{lr.cantidad.to_s} \t\t$ #{lc.precio_unitario.to_s} \t\t$ #{lc.subtotal.to_s}\n"
                    @cotizacionText=@cotizacionText+@detalle
                end
            end

        end


        @usuario=Usuario.find(@provee.usuario_id)
        @user_proveedor=User.find(@usuario.user_id).email #email 
        
        #recibir todos los datos de la cotizacion y crear una cadena o algo así :v para enviarlo
#creando el email
        PostMailer.with(user: @user_proveedor, contenido: @cotizacionText).post_created.deliver_now

        result= {
            mensaje: "Mensaje enviado"
        }
        respond_to do |format|
            if @coti != nil
                format.json { render json: result }
                @coti.estado="Aprobado"
                @reque.estado="Ordenado"
                @coti.save
                @reque.save
            else
                format.json { render json: @cotizacion.errors.full_messages, status: :unprocessable_entity }
            end
        end


    end 

 #   private
  #  def set_requesicion
   #     @requesicion = Requesicion.find(params[:id])
   # end
end
