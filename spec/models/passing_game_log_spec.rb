require 'rails_helper'

describe PassingGameLog do 

  describe "associations" do 
    it { should belong_to(:nfl_player) }    
  end

  describe "#completion_percentage" do
    it "should calculate completion percentage rounded to 1 decimal point" do
      passing = PassingGameLog.new(completions: 25, passing_attempts: 40)

      expect(passing.completion_percentage).to eq(62.5)
    end

    it "should return 0 if completions and passing attempts are both equal to 0" do
      passing = PassingGameLog.new(completions: 0, passing_attempts: 0)

      expect(passing.completion_percentage).to eq(0)
    end

    it "should return 0 if completion percentage is equal to 0.0" do
      passing = PassingGameLog.new(completions: 0, passing_attempts: 10)

      expect(passing.completion_percentage).to eq(0)
    end
  end

  describe "#yards_per_attempt" do
    it "should calculate average yards per attempt rounded to 1 decimal point" do
      passing = PassingGameLog.new(passing_attempts: 40, passing_yards: 350)

      expect(passing.yards_per_attempt).to eq(8.8)
    end

    it "should return 0 if passing attempts and passing yards are both equal to 0" do
      passing = PassingGameLog.new(passing_attempts: 0, passing_yards: 0)

      expect(passing.yards_per_attempt).to eq(0)
    end

    it "should return 0 if yards per attempt is equal to 0.0" do
      passing = PassingGameLog.new(passing_attempts: 10, passing_yards: 0)

      expect(passing.yards_per_attempt).to eq(0)
    end
  end
end