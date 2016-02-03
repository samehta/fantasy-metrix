class RemoveUnusefulFieldsFromPlayers < ActiveRecord::Migration
  def change
    remove_column :players, :draft, :float
    remove_column :players, :experience, :string
  end
end
