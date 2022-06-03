class EvaluacionsController < ApplicationController
    before_action :authenticate_user!
    def index
        @proveedores=Proveedor.all()
        @evaluaciones=Evaluacion.all()
    end
    def new
        @proveedor=Proveedor.find(params[:id])
        @preguntas= Array["Nivel de servicio postventa", "Periodos de garantía", "Localización", "Existencia de servicios de
            Atención al cliente","Instalaciones","Fuerza técnica","Capacidad financiera","Nivel organizativo"]
    end
    def create
        @proveedor=Proveedor.find(params[:id])
        @eva1=Evaluacion.new
        @eva1.proveedor_id=params[:id]
        @eva1.pregunta=params[:pre]
        @eva1.calificacion=params[:cali]
        result= {
            mensaje: "Evaluacion guardada"
        }
        respond_to do |format|
            if @proveedor != nil
                format.json { render json: result }
                @eva1.save
                
            else
                format.json { render json: @eva1.errors.full_messages, status: :unprocessable_entity }
            end
        end 

    end
    def edit
    end

end
