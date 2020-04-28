class CreateDailychecklists < ActiveRecord::Migration[6.0]
  def change
    create_table :dailychecklists do |t|
      t.integer :user, foreign_key: true
      t.string :name
      t.integer :num_of_boxes

      t.timestamps
    end
  end
end