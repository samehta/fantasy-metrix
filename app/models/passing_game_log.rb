class PassingGameLog < ActiveRecord::Base
  belongs_to :nfl_player

  default_scope { order('created_at ASC') }

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

  def fantasy_points
    return 0 if (passing_yards == 0 && passing_touchdowns == 0)
    fp = ((passing_yards.to_f / 25) + (passing_touchdowns.to_f * 4) + (rushing_yards.to_f / 10) + (rushing_touchdowns.to_f * 6) + (interceptions.to_f * -1)).round(1)
    fp == 0.0 ? 0 : fp
  end
end