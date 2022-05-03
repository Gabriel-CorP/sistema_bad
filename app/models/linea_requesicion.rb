class LineaRequesicion < ApplicationRecord
  belongs_to :producto
  belongs_to :requesicion
  has_many :linea_cotizacions
end
