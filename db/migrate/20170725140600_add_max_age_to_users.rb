class AddMaxAgeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :max_age, :integer
  end
end
