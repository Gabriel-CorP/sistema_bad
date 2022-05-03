class CreateLineaRequesicions < ActiveRecord::Migration[7.0]
  def change
    create_table :linea_requesicions do |t|
      t.references :producto, null: false, foreign_key: true
      t.references :requesicion, null: false, foreign_key: true
      t.string :cantidad

      t.timestamps
    end
  end
end
