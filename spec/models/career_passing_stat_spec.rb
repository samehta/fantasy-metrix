require 'rails_helper'

describe CareerPassingStat do 

  describe "associations" do 
    it { should belong_to(:player) }    
  end

  describe "completion percentage" do
    it "should calculate completion percentage rounded to 1 decimal point" do
      passing = CareerPassingStat.new(completions: 329, passing_attempts: 483)

      expect(passing.completion_percentage).to eq(68.1)
    end
  end

  describe "yards per attempt" do
    it "should calculate average yards per attempt rounded to 1 decimal point" do
      passing = CareerPassingStat.new(passing_attempts: 483, passing_yards: 4024)

      expect(passing.yards_per_attempt).to eq(8.3)
    end
  end

  describe "yards per game" do
    it "should calculate average yards per game rounded to 1 decimal point" do
      passing = CareerPassingStat.new(games_played: 16, passing_yards: 4024)

      expect(passing.yards_per_game).to eq(251.5)
    end
  end
end