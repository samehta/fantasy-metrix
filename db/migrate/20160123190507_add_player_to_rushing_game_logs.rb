class AddPlayerToRushingGameLogs < ActiveRecord::Migration
  def change
    add_column :rushing_game_logs, :player_id, :integer
    add_index :rushing_game_logs, :player_id
  end
end
