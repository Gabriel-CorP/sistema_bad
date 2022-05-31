class Usuario < ApplicationRecord
  #belongs_to :user
  belongs_to :rol
  belongs_to :user
  #belongs_to :lro
  has_one :proveedor , :dependent =>:destroy
  has_many :requesicions


  validates_presence_of :nombre,presence:true,:message =>"-> El nombre debe ser digitado"
  validates_presence_of :apellido,presence:true,:message =>"-> El apellido debe ser digitado"
  validates_presence_of :edad,presence:true,:message =>"-> La edad debe ser digitada"
  validates :edad ,numericality: { less_than: 60 ,:message => "Solo se admiten edades menores a 60 años" }
  validates_presence_of :dui,presence:true,:message =>"-> El numero de DUI debe ser digitado"
  validates_format_of :dui, :with => /\A^\d{8}-\d$\Z/, :message => "el formato debe ser  ########-# "
  validates_presence_of :isss,presence:true,:message =>"-> El numero de ISSS debe ser digitado"
  validates_format_of :isss , :with => /\d{9}\Z/, :message => "El numero de ISSS debe ser  de nueve digitos juntos sin espacios ni guiones "
  validates_presence_of :afp,presence:true,:message =>"-> El numero de AFP debe ser digitado"
  validates_format_of :afp , :with => /\d{12}\Z/, :message => "El numero de AFP debe ser  de doce digitos juntos sin espacios ni guiones "
end
