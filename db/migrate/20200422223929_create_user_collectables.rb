class CreateUserCollectables < ActiveRecord::Migration[6.0]
  def change
    create_table :users_collectables do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.integer :collectable_id, null: false, foreign_key: true
      t.boolean :is_collected
      t.boolean :is_donated
      
      t.timestamps
    end
  end
end