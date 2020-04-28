class RemoveNumOfBoxesFromDailychecklists < ActiveRecord::Migration[6.0]
  def change
    remove_column :dailychecklists, :num_of_boxes
  end
end
