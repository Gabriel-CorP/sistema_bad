module UsuariosHelper

    def buscarRol(id)
        (Rol.find(id)).rol
    end

    def buscarUser(id)
        (User.find(id)).email
    end

    def validarRol(id)
        var = (Usuario.find(id)).rol_id
        
        
    end 
    
end
