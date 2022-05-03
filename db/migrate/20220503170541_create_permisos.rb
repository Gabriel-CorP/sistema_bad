class CreatePermisos < ActiveRecord::Migration[7.0]
  def change
    create_table :permisos do |t|
      t.string :permiso
      t.references :rol, null: false, foreign_key: true

      t.timestamps
    end
  end
end
