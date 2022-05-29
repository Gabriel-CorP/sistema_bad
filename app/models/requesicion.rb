class Requesicion < ApplicationRecord
  belongs_to :usuario
  has_many :linea_requesicions, dependent: :destroy
  has_many :cotizacions
end
