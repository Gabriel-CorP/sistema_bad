class CreateUsuarios < ActiveRecord::Migration[7.0]
    def change
      create_table :usuarios do |t|
        t.string :nombre
        t.string :apellido
        t.integer :edad
        t.string :dui
        t.string :isss
        t.string :afp
        t.bigint :user_id, null: false, foreign_key: true
        t.references :rol, null: false, foreign_key: true
  
        t.timestamps
      end
    end
  end
  