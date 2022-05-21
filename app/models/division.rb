class Division < ApplicationRecord
  belongs_to :proveedor
  has_many :cargos

  
end
