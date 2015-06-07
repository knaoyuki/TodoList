class CreatePriorities < ActiveRecord::Migration
  def change
    create_table :priorities do |t|
      t.string :name, null: false
    end
    Priority.create(name: "高")
    Priority.create(name: "中")
    Priority.create(name: "低")
  end
end
