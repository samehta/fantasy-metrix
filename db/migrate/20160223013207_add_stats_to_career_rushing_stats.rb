class AddStatsToCareerRushingStats < ActiveRecord::Migration
  def change
    add_column :career_rushing_stats, :yards_per_game, :float
    add_column :career_rushing_stats, :yards_per_carry, :float
  end
end
