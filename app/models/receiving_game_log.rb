class ReceivingGameLog < ActiveRecord::Base
  belongs_to :player

  def yards_per_reception
    return 0 if (receptions == 0 && receiving_yards == 0)
    ypr = (receiving_yards.to_f / receptions.to_f).round(1)
    ypr == 0.0 ? 0 : ypr
  end
end