class AddRequesicionRefToCotizacion < ActiveRecord::Migration[7.0]
  def change
    add_reference :cotizacions, :requesicion, null: false, foreign_key: true
  end
end
