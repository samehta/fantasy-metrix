require 'rails_helper'

describe CareerPassingStat do 

  describe "associations" do 
    it { should belong_to(:nfl_player) }    
  end

  describe "#calculate_completion_percentage" do
    it "should calculate completion percentage rounded to 1 decimal point" do
      passing = CareerPassingStat.new(completions: 329, passing_attempts: 483)
      expect(passing.send(:calculate_completion_percentage)).to eq(68.1)
    end

    it "should return 0 if completions and passing attempts are both equal to 0" do
      passing = CareerPassingStat.new(completions: 0, passing_attempts: 0)
      expect(passing.send(:calculate_completion_percentage)).to eq(0)
    end

    it "should return 0 if completion percentage is equal to 0.0" do
      passing = CareerPassingStat.new(completions: 0, passing_attempts: 5)
      expect(passing.send(:calculate_completion_percentage)).to eq(0)
    end
  end

  describe "#calculate_yards_per_attempt" do
    it "should calculate average yards per attempt rounded to 1 decimal point" do
      passing = CareerPassingStat.new(passing_attempts: 483, passing_yards: 4024)
      expect(passing.send(:calculate_yards_per_attempt)).to eq(8.3)
    end

    it "should return 0 if passing attempts and passing yards are both equal to 0" do
      passing = CareerPassingStat.new(passing_attempts: 0, passing_yards: 0)
      expect(passing.send(:calculate_yards_per_attempt)).to eq(0)
    end

    it "should return 0 if yards per attempt is equal to 0.0" do
      passing = CareerPassingStat.new(passing_attempts: 5, passing_yards: 0)
      expect(passing.send(:calculate_yards_per_attempt)).to eq(0)
    end
  end

  describe "#calculate_yards_per_game" do
    it "should calculate average yards per game rounded to 1 decimal point" do
      passing = CareerPassingStat.new(games_played: 16, passing_yards: 4024)
      expect(passing.send(:calculate_yards_per_game)).to eq(251.5)
    end

    it "should return 0 if games played and passing yards are both equal to 0" do
      passing = CareerPassingStat.new(games_played: 0, passing_yards: 0)
      expect(passing.send(:calculate_yards_per_game)).to eq(0)
    end

    it "should return 0 if yards per game is equal to 0.0" do
      passing = CareerPassingStat.new(games_played: 5, passing_yards: 0)
      expect(passing.send(:calculate_yards_per_game)).to eq(0)
    end
  end
end