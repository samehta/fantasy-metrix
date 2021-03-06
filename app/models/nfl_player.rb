class NflPlayer < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  belongs_to :nfl_team
  has_many :passing_game_logs, dependent: :destroy
  has_many :rushing_game_logs, dependent: :destroy
  has_many :receiving_game_logs, dependent: :destroy
  has_many :career_passing_stats, dependent: :destroy
  has_many :career_rushing_stats, dependent: :destroy
  has_many :career_receiving_stats, dependent: :destroy

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