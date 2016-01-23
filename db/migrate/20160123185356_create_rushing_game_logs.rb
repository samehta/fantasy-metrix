class CreateRushingGameLogs < ActiveRecord::Migration
  def change
    create_table :rushing_game_logs do |t|
      t.integer :season
      t.integer :week
      t.date :date
      t.string :opponent
      t.integer :rushing_attempts
      t.integer :rushing_yards
      t.integer :rushing_touchdowns
      t.integer :receptions
      t.integer :receiving_yards
      t.integer :receiving_touchdowns
      t.decimal :fantasy_points
      t.decimal :ppr_fantasy_points

      t.timestamps null: false
    end
  end
end
