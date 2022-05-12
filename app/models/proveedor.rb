class Proveedor < ApplicationRecord
  belongs_to :usuario
  has_many :divisions
  has_one :evaluacion
  has_many :refereces
  has_many :cotizacions

  #para las imagenes
  has_one_attached:logo
  has_many_attached:escrituras
end
