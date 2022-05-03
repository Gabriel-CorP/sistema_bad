class CreateLineaCotizacions < ActiveRecord::Migration[7.0]
  def change
    create_table :linea_cotizacions do |t|
      t.references :linea_requesicion, null: false, foreign_key: true
      t.references :cotizacion, null: false, foreign_key: true
      t.float :precio_unitario
      t.float :subtotal

      t.timestamps
    end
  end
end
