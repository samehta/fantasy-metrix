require 'rails_helper'

describe PassingGameLog do 

  describe "associations" do 
    it { should belong_to(:player) }    
  end

  describe "completion percentage" do
    it "should calculate completion percentage rounded to 1 decimal point" do
      passing = PassingGameLog.new(completions: 25, passing_attempts: 40)

      expect(passing.completion_percentage).to eq(62.5)
    end
  end

  describe "yards per attempt" do
    it "should calculate average yards per attempt rounded to 1 decimal point" do
      passing = PassingGameLog.new(passing_attempts: 40, passing_yards: 350)

      expect(passing.yards_per_attempt).to eq(8.8)
    end
  end
end