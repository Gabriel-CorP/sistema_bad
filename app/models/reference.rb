class Reference < ApplicationRecord
  belongs_to :proveedor

  validates_presence_of :nombre_entidad,presence:true,:message =>"-> El nombre de la entidad debe ser digitado"
  validates_presence_of :nombre_contacto,presence:true,:message =>"-> El nombre de contacto  debe ser digitado"
  validates_format_of :telefono_contacto, :with => /\A[0-9]{4}\s[0-9]{4}\Z/, :message => "el formato debe ser  2777 7777 "
end
