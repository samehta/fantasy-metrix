class CareerPassingStat < ActiveRecord::Base
  belongs_to :nfl_player
  before_save :calculate_completion_percentage
  before_save :calculate_yards_per_attempt
  before_save :calculate_yards_per_game
  before_save :calculate_fantasy_points

  default_scope { order('created_at ASC') }

  private

  def calculate_completion_percentage
    if (completions == 0 && passing_attempts == 0)
      completion_percentage = 0
    else
      completion_percentage = ((completions.to_f / passing_attempts.to_f) * 100).round(1)
      completion_percentage = 0 if completion_percentage == 0.0
    end
    self.completion_percentage = completion_percentage
  end

  def calculate_yards_per_attempt
    if (passing_yards == 0 && passing_attempts == 0)
      yards_per_attempt = 0
    else
      yards_per_attempt = (passing_yards.to_f / passing_attempts.to_f).round(1)
      yards_per_attempt = 0 if yards_per_attempt == 0.0
    end
    self.yards_per_attempt = yards_per_attempt
  end

  def calculate_yards_per_game
    if (passing_yards == 0 && games_played == 0)
      yards_per_game = 0
    else
      yards_per_game = (passing_yards.to_f / games_played.to_f).round(1)
      yards_per_game = 0 if yards_per_game == 0.0
    end
    self.yards_per_game = yards_per_game
  end

  def calculate_fantasy_points
    if (passing_yards == 0 && passing_touchdowns == 0 && rushing_yards == 0 && rushing_touchdowns == 0)
      fantasy_points == 0
    else
      fantasy_points = ((passing_yards.to_f / 25) + (passing_touchdowns.to_f * 4) + (rushing_yards.to_f / 10) + (rushing_touchdowns.to_f * 6) + (interceptions.to_f * -1)).round(1)
      fantasy_points = 0 if fantasy_points == 0.0
    end
    self.fantasy_points = fantasy_points
  end
end