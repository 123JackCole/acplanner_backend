class CreateVillagers < ActiveRecord::Migration[6.0]
  def change
    create_table :villagers do |t|
      t.string :name
      t.string :image
      t.string :quote
      t.string :gender
      t.string :personality
      t.string :species
      t.string :birthday
      t.string :sign
      t.string :phrase
      t.string :clothes
      t.string :picture

      t.timestamps
    end
  end
end