class ChangeDateFormatInCareerStats < ActiveRecord::Migration
  def change
    change_column :career_passing_stats, :year, 'integer USING CAST("year" AS integer)'
    change_column :career_rushing_stats, :year, 'integer USING CAST("year" AS integer)'
    change_column :career_receiving_stats, :year, 'integer USING CAST("year" AS integer)'
  end
end
