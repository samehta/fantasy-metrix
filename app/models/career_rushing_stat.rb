class CareerRushingStat < ActiveRecord::Base
  belongs_to :nfl_player
  before_save :calculate_yards_per_game
  before_save :calculate_yards_per_carry

  private

  def calculate_yards_per_game
    if (games_played == 0 && rushing_yards == 0)
      yards_per_game = 0
    else
      yards_per_game = (rushing_yards.to_f / games_played.to_f).round(1)
      yards_per_game = 0 if yards_per_game == 0.0
    end
    self.yards_per_game = yards_per_game
  end

  def calculate_yards_per_carry
    if (rushing_yards == 0 && rushing_attempts == 0)
      yards_per_carry = 0
    else
      yards_per_carry = (rushing_yards.to_f / rushing_attempts.to_f).round(1)
      yards_per_carry = 0 if yards_per_carry == 0.0
    end
    self.yards_per_carry = yards_per_carry
  end
end