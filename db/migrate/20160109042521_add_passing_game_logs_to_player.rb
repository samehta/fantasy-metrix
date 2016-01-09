class AddPassingGameLogsToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :passing_game_log_id, :integer
    add_index :players, :passing_game_log_id
  end
end
