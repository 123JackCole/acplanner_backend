class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.integer :dailychecklist, foreign_key: true
      t.string :name
      t.integer :num_of_boxes

      t.timestamps
    end
  end
end
