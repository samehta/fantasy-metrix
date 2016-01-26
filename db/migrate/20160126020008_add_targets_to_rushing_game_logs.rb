class AddTargetsToRushingGameLogs < ActiveRecord::Migration
  def change
    add_column :rushing_game_logs, :targets, :integer
  end
end
