class AddPlayerToReceivingGameLogs < ActiveRecord::Migration
  def change
    add_column :receiving_game_logs, :player_id, :integer
    add_index :receiving_game_logs, :player_id
  end
end
