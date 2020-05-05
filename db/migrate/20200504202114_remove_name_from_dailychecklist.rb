class RemoveNameFromDailychecklist < ActiveRecord::Migration[6.0]
  def change
    remove_column :dailychecklists, :name
  end
end
