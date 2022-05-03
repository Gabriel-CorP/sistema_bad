class CreateRequesicions < ActiveRecord::Migration[7.0]
  def change
    create_table :requesicions do |t|
      t.references :usuario, null: false, foreign_key: true
      t.date :fecha_solicitud
      t.date :fecha_entrega
      t.string :estado
      t.string :observacion
      t.string :prioridad

      t.timestamps
    end
  end
end
