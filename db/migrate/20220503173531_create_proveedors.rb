class CreateProveedors < ActiveRecord::Migration[7.0]
  def change
    create_table :proveedors do |t|
      t.references :usuario, null: false, foreign_key: true
      t.string :compania
      t.string :representante_legal
      t.string :direccion
      t.string :telefono
      t.string :fax
      t.string :celular
      t.string :nombre_contacto
      t.string :web_site
      t.string :nrc
      t.string :anios
      t.string :rubro
      t.string :logo
      t.string :escritura_constitucion
      t.string :img_ubicacion_sucursales

      t.timestamps
    end
  end
end
