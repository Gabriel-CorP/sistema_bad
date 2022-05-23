class TipoProducto < ApplicationRecord
    has_many :productos
    has_one :proveedor
end
