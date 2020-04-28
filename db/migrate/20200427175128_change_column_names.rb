class ChangeColumnNames < ActiveRecord::Migration[6.0]
  def change
    rename_column :bugs, :collectable, :collectable_id
    rename_column :fish, :collectable, :collectable_id
    rename_column :fossils, :collectable, :collectable_id
  end
end
