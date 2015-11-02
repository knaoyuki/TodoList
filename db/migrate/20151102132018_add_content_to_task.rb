class AddContentToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :contents, :string
  end
end
