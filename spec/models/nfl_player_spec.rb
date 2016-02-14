require 'rails_helper'

describe NflPlayer do 

  describe "associations" do 
    it { should belong_to(:nfl_team) }
    it { should have_many(:passing_game_logs) }
    it { should have_many(:rushing_game_logs) }
    it { should have_many(:receiving_game_logs) }
    it { should have_many(:career_passing_stats) }    
    it { should have_many(:career_rushing_stats) }
    it { should have_many(:career_receiving_stats) }
  end

  describe "#age" do
    it "should calculate a player's age from their birth date" do
      nfl_player = NflPlayer.new(date_of_birth: "November 1, 1991")

      expect(nfl_player.age).to eq(24)
    end
  end

  describe "#quarterback?" do
    it "should only return true if a player's position is quarterback" do
      nfl_player1 = NflPlayer.new(position: "Quarterback")
      nfl_player2 = NflPlayer.new(position: "Running Back")

      expect(nfl_player1.quarterback?).to eq(true)
      expect(nfl_player2.quarterback?).to eq(false)
    end
  end

  describe "#running_back?" do
    it "should only return true if a player's position is running back" do
      nfl_player1 = NflPlayer.new(position: "Running Back")
      nfl_player2 = NflPlayer.new(position: "Wide Receiver")

      expect(nfl_player1.running_back?).to eq(true)
      expect(nfl_player2.running_back?).to eq(false)
    end
  end

  describe "#wide_receiver?" do
    it "should only return true if a player's position is wide receiver" do
      nfl_player1 = NflPlayer.new(position: "Wide Receiver")
      nfl_player2 = NflPlayer.new(position: "Tight End")

      expect(nfl_player1.wide_receiver?).to eq(true)
      expect(nfl_player2.wide_receiver?).to eq(false)
    end
  end

  describe "#tight_end?" do
    it "should only return true if a player's position is tight end" do
      nfl_player1 = NflPlayer.new(position: "Tight End")
      nfl_player2 = NflPlayer.new(position: "Quarterback")

      expect(nfl_player1.tight_end?).to eq(true)
      expect(nfl_player2.tight_end?).to eq(false)
    end
  end

end