module UsuariosHelper

    def buscarRol(id)
        (Rol.find(id)).rol
    end

    def buscarUser(id)
        (User.find(id)).user
    end
end
