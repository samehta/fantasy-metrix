class CreateCareerPassingStats < ActiveRecord::Migration
  def change
    create_table :career_passing_stats do |t|
      t.date :year
      t.string :team
      t.integer :games_played
      t.integer :completions
      t.integer :passing_attempts
      t.integer :passing_yards
      t.integer :passing_touchdowns
      t.integer :three_hundred_plus
      t.integer :rushing_attempts
      t.integer :rushing_yards
      t.integer :rushing_touchdowns
      t.decimal :fantasy_points

      t.timestamps null: false
    end
  end
end
