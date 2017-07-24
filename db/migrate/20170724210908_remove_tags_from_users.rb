class RemoveTagsFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :tags, :text
  end
end
