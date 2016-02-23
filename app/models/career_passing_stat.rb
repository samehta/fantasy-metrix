class CareerPassingStat < ActiveRecord::Base
  belongs_to :nfl_player
  before_save :calculate_completion_percentage
  before_save :calculate_yards_per_attempt
  before_save :calculate_yards_per_game

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
end