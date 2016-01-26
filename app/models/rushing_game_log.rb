class RushingGameLog < ActiveRecord::Base
  belongs_to :player

  def yards_per_carry
    (rushing_yards.to_f / rushing_attempts.to_f).round(1)
  end
end