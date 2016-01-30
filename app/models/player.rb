class Player < ActiveRecord::Base
  belongs_to :team
  has_many :passing_game_logs
  has_many :rushing_game_logs
  has_many :receiving_game_logs
  has_many :career_passing_stats
  has_many :career_rushing_stats
  has_many :career_receiving_stats

  def age
    year_constant = 10000
    (Date.today.strftime('%Y%m%d').to_i - date_of_birth.strftime('%Y%m%d').to_i) / year_constant
  end

  def quarterback?
    self.position == "Quarterback"
  end

  def running_back?
    self.position == "Running Back"
  end

  def wide_receiver?
    self.position == "Wide Receiver"
  end

  def tight_end?
    self.position == "Tight End"
  end
end