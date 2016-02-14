class RenamePlayersTableToNflPlayers < ActiveRecord::Migration
  def change
    rename_table :players, :nfl_players
  end
end
