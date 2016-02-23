class AddStatsToCareerPassingStats < ActiveRecord::Migration
  def change
    add_column :career_passing_stats, :completion_percentage, :float
    add_column :career_passing_stats, :yards_per_attempt, :float
    add_column :career_passing_stats, :yards_per_game, :float
  end
end
