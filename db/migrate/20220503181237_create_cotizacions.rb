class CreateCotizacions < ActiveRecord::Migration[7.0]
  def change
    create_table :cotizacions do |t|
      t.references :proveedor, null: false, foreign_key: true
      t.float :descuento_efectivo
      t.float :descuento_pronto_pago
      t.float :descuento_volumen
      t.float :descuento_forma_pago
      t.float :envases_embalage
      t.float :pago_transporte
      t.float :recargo_aplazamiento
      t.string :estado
      t.float :total
      t.date :fecha_realizacion
      t.date :fecha_entrega

      t.timestamps
    end
  end
end
