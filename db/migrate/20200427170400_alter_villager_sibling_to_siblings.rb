class AlterVillagerSiblingToSiblings < ActiveRecord::Migration[6.0]
  def change
    rename_column :villagers, :sibling, :siblings
  end
end
