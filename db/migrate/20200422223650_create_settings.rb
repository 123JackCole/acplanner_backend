class CreateSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :settings do |t|
      t.integer :user, foreign_key: true
      t.date :time
      t.string :hemisphere
      t.date :birthday

      t.timestamps
    end
  end
end