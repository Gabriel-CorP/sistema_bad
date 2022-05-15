class Ubicacion < ApplicationRecord
  belongs_to :proveedor

  has_one_attached:local
  has_one_attached:mapa
end
