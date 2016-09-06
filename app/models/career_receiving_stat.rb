class CareerReceivingStat < ActiveRecord::Base
  belongs_to :nfl_player
  before_save :calculate_yards_per_game
  before_save :calculate_yards_per_reception
  before_save :calculate_fantasy_points
  before_save :calculate_ppr_fantasy_points

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

  def calculate_fantasy_points
    if (receiving_yards == 0 && receiving_touchdowns == 0 && rushing_yards == 0 && rushing_touchdowns == 0)
      fantasy_points = 0
    else
      fantasy_points = ((receiving_yards.to_f / 10) + (receiving_touchdowns * 6) + (rushing_yards.to_f / 10) + (rushing_touchdowns.to_f * 6)).round(1)
      fantasy_points = 0 if fantasy_points == 0.0
    end
    self.fantasy_points = fantasy_points
  end

  def calculate_ppr_fantasy_points
    if (receiving_yards == 0 && receiving_touchdowns == 0 && rushing_yards == 0 && rushing_touchdowns == 0 && receptions == 0)
      ppr_fantasy_points = 0
    else
      ppr_fantasy_points = ((receiving_yards.to_f / 10) + (receiving_touchdowns * 6) + (rushing_yards.to_f / 10) + (rushing_touchdowns.to_f * 6) + (receptions.to_f * 0.5)).round(1)
      ppr_fantasy_points = 0 if ppr_fantasy_points == 0.0
    end
    self.ppr_fantasy_points = ppr_fantasy_points
  end
end