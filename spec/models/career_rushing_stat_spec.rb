require 'rails_helper'

describe CareerRushingStat do 

  describe "associations" do 
    it { should belong_to(:nfl_player) }
  end

  describe "#yards_per_game" do
    it "should calculate yards per game rounded to 1 decimal" do
      rushing = CareerRushingStat.new(games_played: 16, rushing_yards: 1485)

      expect(rushing.yards_per_game).to eq(92.8)
    end

    it "should return 0 if games played and rushing yards are both equal to 0" do
      rushing = CareerRushingStat.new(games_played: 0, rushing_yards: 0)

      expect(rushing.yards_per_game).to eq(0)
    end

    it "should return 0 if yards per game is equal to 0.0" do
      rushing = CareerRushingStat.new(games_played: 8, rushing_yards: 0)

      expect(rushing.yards_per_game).to eq(0)
    end
  end

  describe "#yards_per_carry" do
    it "should calculate yards per rushing attempt rounded to 1 decimal point" do
      rushing = CareerRushingStat.new(rushing_attempts: 327, rushing_yards: 1485)

      expect(rushing.yards_per_carry).to eq(4.5)
    end

    it "should return 0 if rushing attempts and rushing yards are both equal to 0" do
      rushing = CareerRushingStat.new(rushing_attempts: 0, rushing_yards: 0)

      expect(rushing.yards_per_carry).to eq(0)
    end

    it "should return 0 if yards per carry is equal to 0.0" do
      rushing = CareerRushingStat.new(rushing_attempts: 30, rushing_yards: 0)

      expect(rushing.yards_per_carry).to eq(0)
    end
  end    
end