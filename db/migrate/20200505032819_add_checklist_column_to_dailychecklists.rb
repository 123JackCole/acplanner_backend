class AddChecklistColumnToDailychecklists < ActiveRecord::Migration[6.0]
  def change
    add_column :dailychecklists, :checked_statuses, :string
  end
end
