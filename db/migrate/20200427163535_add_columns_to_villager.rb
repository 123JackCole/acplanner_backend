class AddColumnsToVillager < ActiveRecord::Migration[6.0]
  def change
    add_column :villagers, :sibling, :string
    add_column :villagers, :goal, :string
    add_column :villagers, :fear, :string
    add_column :villagers, :favclothing, :string
    add_column :villagers, :leastfavclothing, :string
    add_column :villagers, :favcolor, :string
  end
end
