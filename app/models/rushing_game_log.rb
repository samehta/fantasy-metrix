class RushingGameLog < ActiveRecord::Base
  belongs_to :nfl_player

  default_scope { order('created_at ASC') }

  def yards_per_carry
    return 0 if (rushing_yards == 0 && rushing_attempts == 0)
    ypc = (rushing_yards.to_f / rushing_attempts.to_f).round(1)
    ypc == 0.0 ? 0 : ypc
  end

  def fantasy_points
    return 0 if (rushing_yards == 0 && rushing_touchdowns == 0 && receiving_yards == 0 && receiving_touchdowns == 0)
    fp = ((rushing_yards.to_f / 10) + (rushing_touchdowns.to_f * 6) + (receiving_yards.to_f / 10) + (receiving_touchdowns.to_f * 6)).round(1)
    fp == 0.0 ? 0 : fp
  end

  def ppr_fantasy_points
    return 0 if (rushing_yards == 0 && rushing_touchdowns == 0 && receiving_yards == 0 && receiving_touchdowns == 0 && receptions == 0)
    fp = ((rushing_yards.to_f / 10) + (rushing_touchdowns.to_f * 6) + (receiving_yards.to_f / 10) + (receiving_touchdowns.to_f * 6) + (receptions.to_f * 0.5)).round(1)
    fp == 0.0 ? 0 : fp
  end
end