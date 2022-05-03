class Proveedor < ApplicationRecord
  belongs_to :usuario
  has_many :divisions
  has_one :evaluacion
  has_many :refereces
  has_many :cotizacions
end
