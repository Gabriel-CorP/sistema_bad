class CreateEvaluacions < ActiveRecord::Migration[7.0]
  def change
    create_table :evaluacions do |t|
      t.references :proveedor, null: false, foreign_key: true
      t.string :pregunta
      t.float :calificacion

      t.timestamps
    end
  end
end
