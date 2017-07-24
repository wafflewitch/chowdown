class AddNewColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :tag1, :string
    add_column :users, :tag2, :string
    add_column :users, :tag3, :string
    add_column :users, :tag4, :string
    add_column :users, :tag5, :string
  end
end
