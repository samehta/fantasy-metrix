require 'rails_helper'

describe PassingGameLog do 

  describe "associations" do 
    it { should belong_to(:player) }    
  end

  describe "completion percentage" do
    it "should calculate completion percentage rounded to 1 decimal point" do
      passing = create(:passing_game_log)
      CP = ((passing.completions.to_f / passing.passing_attempts.to_f) * 100).round(1)

      expect(passing.completion_percentage).to eq(CP)
    end
  end

  describe "yards per attempt" do
    it "should calculate average yards per attempt rounded to 1 decimal point" do
      passing = create(:passing_game_log)
      YPA = (passing.passing_yards.to_f / passing.passing_attempts.to_f).round(1)

      expect(passing.yards_per_attempt).to eq(YPA)
    end
  end
end