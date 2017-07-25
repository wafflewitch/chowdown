class AddMinAgeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :min_age, :integer
  end
end
