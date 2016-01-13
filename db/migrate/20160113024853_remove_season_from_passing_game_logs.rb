class RemoveSeasonFromPassingGameLogs < ActiveRecord::Migration
  def change
    remove_column :passing_game_logs, :season, :date
    add_column :passing_game_logs, :season, :integer
  end
end
