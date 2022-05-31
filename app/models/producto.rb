class Producto < ApplicationRecord
    has_many :linea_requesicions
    belongs_to :tipo_producto

    # Imagen del producto
    has_one_attached :imagen

    # Validaciones
    validates_presence_of :nombre, presence: true, :message => "El producto debe tener un nombre"
    validates_presence_of :descripcion, presence: true, :message => "El producto debe tener una descripción"
    validates_presence_of :presentacion, presence: true, :message => "El producto debe tener una presentación"
    validates :precio, numericality: { greater_than_or_equal_to: 0, less_than: BigDecimal(10**6) },
    format: { with: /\A\d{1,3}(\.\d{1,2})?\z/ }
    validates :existencias, numericality: { greater_than_or_equal_to: 0, less_than: BigDecimal(10**6) },
    format: { with: /\A\d{1,3}(\.\d{1,2})?\z/ }

    def self.buscador(criterio)
        Producto.where("nombre LIKE ?", "%#{termino}%")
    end
end
