class CreateReferences < ActiveRecord::Migration[7.0]
  def change
    create_table :references do |t|
      t.references :proveedor, null: false, foreign_key: true
      t.string :nombre_entidad
      t.string :nombre_contacto
      t.string :telefono_contacto

      t.timestamps
    end
  end
end
