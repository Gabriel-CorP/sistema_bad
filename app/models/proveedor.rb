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
  #validaciones para usuario
  validates_presence_of :usuario_id, presence: true
  #validaciones para compania
  validates_presence_of :compania, presence: true ,:message => "->Nombre de la compañia no puede estar vacio"
  validates_presence_of :tipo_producto_id, presence: true
  #valiaciones para representante legal
  validates_presence_of :representante_legal, presence: true ,:message => "-> Nombre del representante legal no puede estar vacio"
  #validaciones para direccion
  validates_presence_of :direccion, presence: true,:message => "->La direccion no puede esta vacia"
  #validaciones para telefono
  validates_presence_of :telefono, presence: true,:message => "->El numero de telefonico no puede esta vacio"
  validates_format_of :telefono, :with => /\A[0-9]{4}\s[0-9]{4}\Z/, :message => "el formato debe ser  2777 7777 "
  #validaciones para fax
  validates_presence_of :fax, presence: true,:message => "->El numero de fax no puede estar vacio"
  #validaciones para celular
  validates_presence_of :celular, presence: true,:message => "->El numero de celular no puede estar vacio"
  validates_format_of :celular, :with => /\A[0-9]{4}\s[0-9]{4}\Z/, :message => "el formato debe ser  7777 7777 "
  #validaciones para nombre de contacto
  validates_presence_of :nombre_contacto, presence: true,:message => "->El nombre de contacto no puede estar vacio"
  #validaciones para website
  validates_presence_of :web_site, presence: true,:message => "->El sitio web no puede estar vacio"
  validates_format_of :web_site, :with =>/\A^[a-z0-9]+([\-\.]{1}[a-z0-9A-Z]+)*\.[a-z]{2,5}$\Z/ ,:message => "el formato debe ser  www.miPagina.com " 
  #validaciones para numero NRC
  validates_presence_of :nrc, presence: true,:message => "->El numero NRC puede estar vacio"
  #validacion de años
  validates_presence_of :anios, presence: true,:message => "->El campo años no puede estar vacio"
  validates :anios,numericality: { only_integer: true ,:message => "Solo se admiten numeros en los años"} 
  validates :anios ,numericality: { less_than: 130 ,:message => "Solo se admiten años menores a 130" }
  #validaciones para rubro
  #validates_presence_of :rubro, presence: true,:message => "->El rubro no puede estar vacio"
  #validaciones para logo
  validates_presence_of :logo, presence: false,:message => "->El archivo de logo puede estar vacio"
  #validaciones para escritura
  validates_presence_of :escritura, presence: true,:message => "->El archivo de escritura constitucional no puede estar vacio"
  

  
end
