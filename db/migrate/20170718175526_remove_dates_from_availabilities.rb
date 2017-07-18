class RemoveDatesFromAvailabilities < ActiveRecord::Migration[5.0]
  def change
    remove_column :availabilities, :dates, :date
  end
end
