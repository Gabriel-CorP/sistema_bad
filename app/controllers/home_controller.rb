class HomeController < ApplicationController
    def index
        
        if user_signed_in?
            @usuario = User.find(current_user.id)
            if (Usuario.find_by(user_id: @usuario.id) == nil)
                redirect_to "/no_user"
            end
        else
            redirect_to new_user_session_path
        end

    end
    
end
