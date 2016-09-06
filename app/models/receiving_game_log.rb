class ReceivingGameLog < ActiveRecord::Base
  belongs_to :nfl_player

  default_scope { order('created_at ASC') }

  def yards_per_reception
    return 0 if (receptions == 0 && receiving_yards == 0)
    ypr = (receiving_yards.to_f / receptions.to_f).round(1)
    ypr == 0.0 ? 0 : ypr
  end

  def fantasy_points
    return 0 if (receiving_yards == 0 && receiving_touchdowns == 0 && rushing_yards == 0 && rushing_touchdowns == 0)
    fp = ((receiving_yards.to_f / 10) + (receiving_touchdowns.to_f * 6) + (rushing_yards.to_f / 10) + (rushing_touchdowns.to_f * 6)).round(1)
    fp == 0.0 ? 0 : fp
  end

  def ppr_fantasy_points
    return 0 if (receiving_yards == 0 && receiving_touchdowns == 0 && rushing_yards == 0 && rushing_touchdowns == 0 && receptions == 0)
    fp = ((receiving_yards.to_f / 10) + (receiving_touchdowns.to_f * 6) + (rushing_yards.to_f / 10) + (rushing_touchdowns.to_f * 6)+ (receptions.to_f * 0.5)).round(1)
    fp == 0.0 ? 0 : fp
  end
end