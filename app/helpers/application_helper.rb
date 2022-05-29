module ApplicationHelper
     #este helper es para llamar el parcial _ubicacions_fields cada vez que se preciona el boton de añadir ubicacion en el formulario de proveedores
    #le mando tres parametos, el nombre, el formulario padre y el modelo que incrustara
    def link_to_add_fields(name,form,association)
        #creeo el nuevo objeto para la asociacion (:ubicacions)
        new_object = form.object.send(association).klass.new
        # se crea el nuevbo id que tomara el nuevo objeto creado
        id = new_object.object_id
        #creo los campos del form
        fields = form.fields_for(association,new_object,child_index: id) do |builder|
            render(association.to_s+"_fields" ,builder: builder)
        end
        #aqui se para el link de los campos para el form
        link_to(name, '#',class: 'add_fields', data:{id: id , fields: fields.gsub("\n","")})
    end

    
    
    
end
