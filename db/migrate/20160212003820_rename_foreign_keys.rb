class RenameForeignKeys < ActiveRecord::Migration
  def change
    rename_column :nfl_players, :team_id, :nfl_team_id
  end
end
