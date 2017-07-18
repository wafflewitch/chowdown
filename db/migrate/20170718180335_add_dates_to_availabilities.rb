class AddDatesToAvailabilities < ActiveRecord::Migration[5.0]
  def change
    add_column :availabilities, :dates, :date
  end
end
