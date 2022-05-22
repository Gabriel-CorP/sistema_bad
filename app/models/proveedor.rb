class Proveedor < ApplicationRecord
  belongs_to :usuario
  has_many :divisions, :dependent =>:destroy
  has_one :evaluacion
  has_many :references, :dependent =>:destroy
  has_many :cotizacions
  has_many :ubicacions , :dependent =>:destroy
  belongs_to :tipo_producto
  #accepts_nested_attributes_for :ubicacions ,:reject_if => lambda { |a| a[:nombre].blank? && a[:direccion].blank? }, :allow_destroy => true #OJO CON ESTO

  #para las imagenes
  has_one_attached:logo
  #has_many_attached:escrituras
  has_one_attached:escritura

  #validaciones a los campos
       


  
  

  
end
