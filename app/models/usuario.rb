class Usuario < ApplicationRecord
  belongs_to :user
  belongs_to :rol
  has_one :proveedor
  has_many :requesicions
end
