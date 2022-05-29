class Ubicacion < ApplicationRecord
  belongs_to :proveedor

  has_one_attached:local
  has_one_attached:mapa

  validates_presence_of :nombre, presence: true,:message => "->El nombre de de la ubicacion no puede estar vacio"  
  validates_presence_of :direccion, presence: true,:message => "->La direccion no puede estar vacia"
  validates_presence_of :local, presence: true,:message => "-> Archivo de imagen de local no cargada"
  validates_presence_of :mapa, presence: true,:message => "-> Archivo de imagen en mapa no cargada"
end
