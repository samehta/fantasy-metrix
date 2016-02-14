class RenamePlayerForeignKeys < ActiveRecord::Migration
  def change
    rename_column :career_passing_stats, :player_id, :nfl_player_id
    rename_column :career_rushing_stats, :player_id, :nfl_player_id
    rename_column :career_receiving_stats, :player_id, :nfl_player_id
    rename_column :passing_game_logs, :player_id, :nfl_player_id
    rename_column :rushing_game_logs, :player_id, :nfl_player_id
    rename_column :receiving_game_logs, :player_id, :nfl_player_id
  end
end
