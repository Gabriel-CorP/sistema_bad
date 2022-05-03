class Rol < ApplicationRecord
    has_many :permisos
    has_one :usuario
end
