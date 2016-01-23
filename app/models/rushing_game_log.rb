class RushingGameLog < ActiveRecord::Base
  belongs_to :player

  def yards_per_carry
    (rushing_attempts.to_f / rushing_yards.to_f).round(2)
  end
end
