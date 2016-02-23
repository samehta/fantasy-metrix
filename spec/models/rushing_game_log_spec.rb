require 'rails_helper'

describe RushingGameLog do 

  describe "associations" do 
    it { should belong_to(:nfl_player) }    
  end

  describe "#yards_per_carry" do
    it "should calculate yards per rushing attempt rounded to 1 decimal point" do
      rushing = RushingGameLog.new(rushing_attempts: 15, rushing_yards: 80)
      expect(rushing.yards_per_carry).to eq(5.3)
    end

    it "should return 0 if rushing attempts and rushing yards are both equal to 0" do
      rushing = RushingGameLog.new(rushing_attempts: 0, rushing_yards: 0)
      expect(rushing.yards_per_carry).to eq(0)
    end

    it "should return 0 if yards per carry is equal to 0.0" do
      rushing = RushingGameLog.new(rushing_attempts: 15, rushing_yards: 0)
      expect(rushing.yards_per_carry).to eq(0)
    end
  end
end