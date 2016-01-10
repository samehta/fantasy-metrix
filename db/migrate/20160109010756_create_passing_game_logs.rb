class CreatePassingGameLogs < ActiveRecord::Migration
  def change
    create_table :passing_game_logs do |t|
      t.date :season
      t.integer :week
      t.date :date
      t.string :opponent
      t.integer :completions
      t.integer :passing_attempts
      t.integer :passing_yards
      t.integer :passing_touchdowns
      t.integer :interceptions
      t.integer :rushing_attempts
      t.integer :rushing_yards
      t.integer :rushing_touchdowns
      t.decimal :fantasy_points

      t.timestamps null: false
    end
  end
end
