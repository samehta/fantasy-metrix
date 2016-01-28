class AddPlayerToCareerPassingStats < ActiveRecord::Migration
  def change
    add_column :career_passing_stats, :player_id, :integer
    add_index :career_passing_stats, :player_id
  end
end
