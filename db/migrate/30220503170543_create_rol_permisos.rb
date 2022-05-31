class CreateRolPermisos < ActiveRecord::Migration[7.0]
  def change
    create_table :rol_permisos do |t|
      t.references :rol, null: false, foreign_key: true
      t.references :permiso, null: false, foreign_key: true
      t.timestamps
    end
  end
end
