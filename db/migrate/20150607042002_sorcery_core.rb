class SorceryCore < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :mail, :null => false
      t.string :name, :null => false
      t.string :salt
      t.integer :trainer_id
      t.string :crypted_password

      t.timestamps
    end

    add_index :users, :mail, unique: true
  end
end
