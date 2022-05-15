class Proveedor < ApplicationRecord
  belongs_to :usuario
  has_many :divisions
  has_one :evaluacion
  has_many :refereces
  has_many :cotizacions
  has_many :ubicacions , :dependent =>:destroy
  accepts_nested_attributes_for :ubicacions

  #para las imagenes
  has_one_attached:logo
  #has_many_attached:escrituras
  has_one_attached:escritura

  #validaciones a los campos
       

  validates_presence_of :usuario_id, presence: true
  validates_presence_of :compania, presence: true ,:message => "->Nombre de la compañia no puede estar vacio"
  validates_presence_of :representante_legal, presence: true ,:message => "-> Nombre del representante legal no puede estar vacio"
  validates_presence_of :direccion, presence: true,:message => "->La direccion no puede esta vacia"
  validates_presence_of :telefono, presence: true,:message => "->El numero de telefonico no puede esta vacio"
  validates_format_of :telefono, :with => /\A[0-9]{4}\s[0-9]{4}\Z/, :message => "el formato debe ser  2777 7777 "
  validates_presence_of :fax, presence: true,:message => "->El numero de fax no puede estar vacio"
  validates_presence_of :celular, presence: true,:message => "->El numero de celular no puede estar vacio"
  validates_format_of :celular, :with => /\A[0-9]{4}\s[0-9]{4}\Z/, :message => "el formato debe ser  7777 7777 "
  validates_presence_of :nombre_contacto, presence: true,:message => "->El nombre de contacto no puede estar vacio"
  validates_presence_of :web_site, presence: true,:message => "->El sitio web no puede estar vacio"
  validates_format_of :web_site, :with =>/\A^[a-z0-9]+([\-\.]{1}[a-z0-9A-Z]+)*\.[a-z]{2,5}$\Z/ ,:message => "el formato debe ser  www.miPagina.com " 
  validates_presence_of :nrc, presence: true,:message => "->El numero NRC puede estar vacio"
  validates_presence_of :anios, presence: true,:message => "->El campo años no puede estar vacio"
  #pendiente el de años
  validates_presence_of :rubro, presence: true,:message => "->El rubro no puede estar vacio"
  
  

  
end
