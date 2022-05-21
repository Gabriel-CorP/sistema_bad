class CreateUbicacions < ActiveRecord::Migration[7.0]
  def change
    create_table :ubicacions do |t|
      t.string :nombre
      t.string :direccion
      t.references :proveedor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
