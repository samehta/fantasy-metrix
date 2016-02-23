class AddStatsToCareerReceivingStats < ActiveRecord::Migration
  def change
    add_column :career_receiving_stats, :yards_per_game, :float
    add_column :career_receiving_stats, :yards_per_reception, :float
  end
end
