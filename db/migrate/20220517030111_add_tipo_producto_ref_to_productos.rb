class AddTipoProductoRefToProductos < ActiveRecord::Migration[7.0]
  def change
    add_reference :productos, :tipo_producto, null: false, foreign_key: true
  end
end
