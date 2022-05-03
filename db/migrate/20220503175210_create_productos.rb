class CreateProductos < ActiveRecord::Migration[7.0]
  def change
    create_table :productos do |t|
      t.string :nombre
      t.string :descripcion
      t.string :presentacion
      t.float :precio
      t.string :imagen
      t.float :existencias

      t.timestamps
    end
  end
end
