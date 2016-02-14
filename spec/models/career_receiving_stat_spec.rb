require 'rails_helper'

describe CareerReceivingStat do 

  describe "associations" do 
    it { should belong_to(:nfl_player) }    
  end

  describe "#yards_per_game" do
    it "should calculate yards per game rounded to 1 decimal point" do
      receiving = CareerReceivingStat.new(games_played: 16, receiving_yards: 1834)

      expect(receiving.yards_per_game).to eq(114.6)
    end

    it "should return 0 if games played and receiving yards are both equal to 0" do
      receiving = CareerReceivingStat.new(games_played: 0, receiving_yards: 0)

      expect(receiving.yards_per_game).to eq(0)
    end

    it "should return 0 if yards per game is equal to 0.0" do
      receiving = CareerReceivingStat.new(games_played: 8, receiving_yards: 0)

      expect(receiving.yards_per_game).to eq(0)
    end
  end

  describe "#yards_per_reception" do
    it "should calculate yards per reception rounded to 1 decimal point" do
      receiving = CareerReceivingStat.new(receptions: 136, receiving_yards: 1834)

      expect(receiving.yards_per_reception).to eq(13.5)
    end

    it "should return 0 if receptions and receiving yards are both equal to 0" do
      receiving = CareerReceivingStat.new(receptions: 0, receiving_yards: 0)

      expect(receiving.yards_per_reception).to eq(0)
    end

    it "should return 0 if yards per reception is equal to 0.0" do
      receiving = CareerReceivingStat.new(receptions: 10, receiving_yards: 0)

      expect(receiving.yards_per_reception).to eq(0)
    end
  end
end