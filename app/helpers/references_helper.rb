module ReferencesHelper

    def buscarCompania(id)
        val=(Proveedor.find(id)).compania
    end

    
end
