class ChangeAmountName < ActiveRecord::Migration[5.0]
  def change
    remove_column :badges, :amount
  end
end
