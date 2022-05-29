class Division < ApplicationRecord
  belongs_to :proveedor
  has_many :cargos

  validates_presence_of :nombre_empleado,presence:true,:message =>"-> El nombre del empleado debe ser digitado"
end
