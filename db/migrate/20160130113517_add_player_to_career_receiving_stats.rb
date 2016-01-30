class AddPlayerToCareerReceivingStats < ActiveRecord::Migration
  def change
    add_column :career_receiving_stats, :player_id, :integer
    add_index :career_receiving_stats, :player_id
  end
end
