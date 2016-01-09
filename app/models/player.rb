class Player < ActiveRecord::Base
  belongs_to :team
  has_many :passing_game_logs

  def age
    (Date.today.strftime('%Y%m%d').to_i - date_of_birth.strftime('%Y%m%d').to_i) / 10000
  end
end