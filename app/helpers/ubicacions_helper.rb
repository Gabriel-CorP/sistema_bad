module UbicacionsHelper

    def buscarNombreProveedor(id)
        (Proveedor.find(id)).compania
    end

    def buscarLogoProveedor(id)
        (Proveedor.find(id)).logo
    end
end
