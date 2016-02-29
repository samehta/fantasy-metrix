class CareerReceivingStat < ActiveRecord::Base
  belongs_to :nfl_player
  before_save :calculate_yards_per_game
  before_save :calculate_yards_per_reception

  default_scope { order('created_at ASC') }

  private

  def calculate_yards_per_game
    if (games_played == 0 && receiving_yards == 0)
      yards_per_game = 0
    else
      yards_per_game = (receiving_yards.to_f / games_played.to_f).round(1)
      yards_per_game = 0 if yards_per_game == 0.0
    end
    self.yards_per_game = yards_per_game
  end

  def calculate_yards_per_reception
    if (receptions == 0 && receiving_yards == 0)
      yards_per_reception = 0
    else
      yards_per_reception = (receiving_yards.to_f / receptions.to_f).round(1)
      yards_per_reception = 0 if yards_per_reception == 0.0
    end
    self.yards_per_reception = yards_per_reception
  end
end