module ProveedorsHelper

    def buscarReferencias(id) 
        listaReferencias =Reference.where(proveedor_id:id)
    end

    def buscarDivisiones(id)
        #listaDivisiones=Cargo.joins(:division).where(division: {proveedor_id: id})
        listaDivisiones=Division.where(proveedor_id:id)
    end
    
    def buscarCargo(id)
        cargo=(Cargo.find(id)).nombre
    end

    
end
