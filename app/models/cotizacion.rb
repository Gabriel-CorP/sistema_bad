class Cotizacion < ApplicationRecord
  belongs_to :proveedor
  has_many :linea_cotizacions
end
