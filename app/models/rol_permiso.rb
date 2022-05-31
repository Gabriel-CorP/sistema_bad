class RolPermiso < ApplicationRecord
    belongs_to :rol
    belongs_to :permiso
end
