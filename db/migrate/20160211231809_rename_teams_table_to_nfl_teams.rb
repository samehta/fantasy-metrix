class RenameTeamsTableToNflTeams < ActiveRecord::Migration
  def change
    rename_table :teams, :nfl_teams
  end
end
