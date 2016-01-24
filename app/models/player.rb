class Player < ActiveRecord::Base
  belongs_to :team
  has_many :passing_game_logs
  has_many :rushing_game_logs

  def age
    year_constant = 10000
    (Date.today.strftime('%Y%m%d').to_i - date_of_birth.strftime('%Y%m%d').to_i) / year_constant
  end
end