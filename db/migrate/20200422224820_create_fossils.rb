class CreateFossils < ActiveRecord::Migration[6.0]
  def change
    create_table :fossils do |t|
      t.integer :collectable, foreign_key: true
      t.string :name
      t.string :image
      t.string :scientific_name
      t.string :sections
      t.string :period
      t.string :length
      t.string :price

      t.timestamps
    end
  end
end