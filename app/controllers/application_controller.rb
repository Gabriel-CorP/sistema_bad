class ApplicationController < ActionController::Base

def current_ability
    @current_ability ||=Ability.new(current_user)
end



end
