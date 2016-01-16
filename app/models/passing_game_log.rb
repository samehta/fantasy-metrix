class PassingGameLog < ActiveRecord::Base
  belongs_to :player

  def completion_percentage
    ((completions.to_f / passing_attempts.to_f) * 100).round(1)
  end

  def yards_per_attempt 
    (passing_yards.to_f / passing_attempts.to_f).round(1)
  end
end