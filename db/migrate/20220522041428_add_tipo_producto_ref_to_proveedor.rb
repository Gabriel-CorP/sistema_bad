class AddTipoProductoRefToProveedor < ActiveRecord::Migration[7.0]
  def change
    add_reference :proveedors, :tipo_producto, null: false, foreign_key: true
  end
end
