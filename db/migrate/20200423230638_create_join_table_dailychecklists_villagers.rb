class CreateJoinTableDailychecklistsVillagers < ActiveRecord::Migration[6.0]
  def change
    create_table :dailychecklists_villagers do |t|
      t.integer :dailychecklist_id, null: false, foreign_key: true
      t.integer :villager_id, null: false, foreign_key: true
    end
  end
end