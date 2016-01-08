class RemoveAgeFromPlayers < ActiveRecord::Migration
  def change
    remove_column :players, :age, :integer
  end
end
