class AddAbbreviationToNflTeams < ActiveRecord::Migration
  def change
    add_column :nfl_teams, :abbreviation, :string
  end
end
