class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :user_id, null: false
      t.boolean :completed, null: false
      t.integer :priority_id, null: false
      t.string :description, null: false
      t.boolean :deleted, null: false

      t.timestamps null: false
    end
    add_index :tasks, :user_id 
  end
end
