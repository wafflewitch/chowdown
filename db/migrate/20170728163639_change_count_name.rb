class ChangeCountName < ActiveRecord::Migration[5.0]
  def change
    rename_column :badges, :count, :amount
  end
end
