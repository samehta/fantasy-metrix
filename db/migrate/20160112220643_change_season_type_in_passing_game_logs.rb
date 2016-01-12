class ChangeSeasonTypeInPassingGameLogs < ActiveRecord::Migration
  def self.up
    change_column :passing_game_logs, :season, 'integer USING CAST("season" AS integer)'
  end
 
  def self.down
    change_column :passing_game_logs, :season, :date
  end
end
