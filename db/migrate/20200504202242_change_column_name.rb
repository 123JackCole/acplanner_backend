class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :dailychecklists, :user, :user_id
  end
end
