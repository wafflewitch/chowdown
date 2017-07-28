class AddBackLikeToDecision < ActiveRecord::Migration[5.0]
  def change
    add_column :decisions, :reply, :boolean
  end
end
