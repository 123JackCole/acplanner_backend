class CreateFish < ActiveRecord::Migration[6.0]
  def change
    create_table :fish do |t|
      t.integer :collectable, foreign_key: true
      t.string :name
      t.string :image
      t.string :scientific_name
      t.string :family
      t.string :time_year
      t.string :time_day
      t.string :location
      t.string :size
      t.string :rarity
      t.string :price
      t.string :shadow

      t.timestamps
    end
  end
end