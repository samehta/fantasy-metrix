class CareerReceivingStat < ActiveRecord::Base
  belongs_to :player

  def yards_per_game
    return 0 if (games_played == 0 && receiving_yards == 0)
    ypg = (receiving_yards.to_f / games_played.to_f).round(1)
    ypg == 0.0 ? 0 : ypg
  end

  def yards_per_reception
    return 0 if (receptions == 0 && receiving_yards == 0)
    ypr = (receiving_yards.to_f / receptions.to_f).round(1)
    ypr == 0.0 ? 0 : ypr
  end
end
