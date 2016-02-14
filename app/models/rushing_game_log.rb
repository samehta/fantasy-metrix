class RushingGameLog < ActiveRecord::Base
  belongs_to :nfl_player

  def yards_per_carry
    return 0 if (rushing_yards == 0 && rushing_attempts == 0)
    ypc = (rushing_yards.to_f / rushing_attempts.to_f).round(1)
    ypc == 0.0 ? 0 : ypc
  end
end