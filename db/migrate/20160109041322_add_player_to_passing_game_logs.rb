class AddPlayerToPassingGameLogs < ActiveRecord::Migration
  def change
    add_column :passing_game_logs, :player_id, :integer
    add_index :passing_game_logs, :player_id
  end
end
