class AddPlayerToCareerRushingStats < ActiveRecord::Migration
  def change
    add_column :career_rushing_stats, :player_id, :integer
    add_index :career_rushing_stats, :player_id
  end
end
