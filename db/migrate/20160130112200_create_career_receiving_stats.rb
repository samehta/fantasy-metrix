class CreateCareerReceivingStats < ActiveRecord::Migration
  def change
    create_table :career_receiving_stats do |t|
      t.date :year
      t.string :team
      t.integer :games_played
      t.integer :targets
      t.integer :receptions
      t.integer :receiving_yards
      t.integer :hundred_plus
      t.integer :receiving_touchdowns
      t.integer :rushing_attempts
      t.integer :rushing_yards
      t.integer :rushing_touchdowns
      t.decimal :fantasy_points
      t.decimal :ppr_fantasy_points

      t.timestamps null: false
    end
  end
end
