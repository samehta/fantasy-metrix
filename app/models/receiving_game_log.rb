class ReceivingGameLog < ActiveRecord::Base
  belongs_to :player

  def yards_per_reception
    (receiving_yards.to_f / receptions.to_f).round(1)
  end
end