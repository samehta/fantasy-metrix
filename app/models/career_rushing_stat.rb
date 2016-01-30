class CareerRushingStat < ActiveRecord::Base
  belongs_to :player

  def yards_per_game
    return 0 if (games_played == 0 && rushing_yards == 0)
    ypg = (rushing_yards.to_f / games_played.to_f).round(1)
    ypg == 0.0 ? 0 : ypg
  end

  def yards_per_carry
    return 0 if (rushing_yards == 0 && rushing_attempts == 0)
    ypc = (rushing_yards.to_f / rushing_attempts.to_f).round(1)
    ypc == 0.0 ? 0 : ypc
  end
end
