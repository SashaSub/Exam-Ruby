class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :nombre
      t.string :precio
      t.string :descripcion
      t.integer :cantidad

      t.timestamps
    end
  end
end
