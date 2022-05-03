class LineaCotizacion < ApplicationRecord
  belongs_to :linea_requesicion
  belongs_to :cotizacion
end
