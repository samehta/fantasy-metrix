class RemovePassingGameLogsFromPlayer < ActiveRecord::Migration
  def change
    remove_column :players, :passing_game_log_id, :integer
  end
end
