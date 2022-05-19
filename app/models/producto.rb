class Producto < ApplicationRecord
    has_many :linea_requesicion
    belongs_to :tipo_producto
    validates :precio, numericality: { greater_than_or_equal_to: 0, less_than: BigDecimal(10**6) },
    format: { with: /\A\d{1,3}(\.\d{1,2})?\z/ }
    validates :existencias, numericality: { greater_than_or_equal_to: 0, less_than: BigDecimal(10**4) },
    format: { with: /\A\d{1,3}(\.\d{1,2})?\z/ }
end
