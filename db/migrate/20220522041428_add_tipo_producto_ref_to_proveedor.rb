class AddTipoProductoRefToProveedor < ActiveRecord::Migration[7.0]
  def change
    add_reference :proveedors, :TipoProducto, null: false, foreign_key: true
  end
end
