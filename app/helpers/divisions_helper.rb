module DivisionsHelper

    def buscarCompania(id)
        val=(Proveedor.find(id)).compania
    end

    def buscarPuesto(id)
        val=(Cargo.find(id)).nombre
    end


    
end
