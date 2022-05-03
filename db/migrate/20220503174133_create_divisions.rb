class CreateDivisions < ActiveRecord::Migration[7.0]
  def change
    create_table :divisions do |t|
      t.string :nombre_empleado
      t.references :proveedor, null: false, foreign_key: true
      t.references :cargo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
