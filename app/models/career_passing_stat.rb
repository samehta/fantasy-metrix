class CareerPassingStat < ActiveRecord::Base
  belongs_to :player

  def completion_percentage
    return 0 if (completions == 0 && passing_attempts == 0)
    cp = ((completions.to_f / passing_attempts.to_f) * 100).round(1)
    cp == 0.0 ? 0 : cp
  end

  def yards_per_attempt
    return 0 if (passing_yards == 0 && passing_attempts == 0)
    ypa = (passing_yards.to_f / passing_attempts.to_f).round(1)
    ypa == 0.0 ? 0 : ypa
  end

  def yards_per_game
    return 0 if (passing_yards == 0 && games_played == 0)
    ypg = (passing_yards.to_f / games_played.to_f).round(1)
    ypg == 0.0 ? 0 : ypg
  end
end