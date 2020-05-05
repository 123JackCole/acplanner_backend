class ChangeForeignKeyNames < ActiveRecord::Migration[6.0]
  def change
    rename_column :tasks, :dailychecklist, :dailychecklist_id
    rename_column :settings, :user, :user_id
  end
end
