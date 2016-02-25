class AddRankToNflPlayers < ActiveRecord::Migration
  def change
    add_column :nfl_players, :rank, :integer
  end
end
