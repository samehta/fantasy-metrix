require 'rails_helper'

describe Player do 

  describe "associations" do 
    it { should belong_to(:team) }
    it { should have_many(:passing_game_logs) }
    it { should have_many(:rushing_game_logs) }
    it { should have_many(:receiving_game_logs) }
    it { should have_many(:career_passing_stats) }    
    it { should have_many(:career_rushing_stats) }
    it { should have_many(:career_receiving_stats) }
  end

  describe "#age" do
    it "should calculate a player's age from their birth date" do
      player = Player.new(date_of_birth: "November 1, 1991")

      expect(player.age).to eq(24)
    end
  end

  describe "#quarterback?" do
    it "should only return true if a player's position is quarterback" do
      player1 = Player.new(position: "Quarterback")
      player2 = Player.new(position: "Running Back")

      expect(player1.quarterback?).to eq(true)
      expect(player2.quarterback?).to eq(false)
    end
  end

  describe "#running_back?" do
    it "should only return true if a player's position is running back" do
      player1 = Player.new(position: "Running Back")
      player2 = Player.new(position: "Wide Receiver")

      expect(player1.running_back?).to eq(true)
      expect(player2.running_back?).to eq(false)
    end
  end

  describe "#wide_receiver?" do
    it "should only return true if a player's position wide receiver" do
      player1 = Player.new(position: "Wide Receiver")
      player2 = Player.new(position: "Tight End")

      expect(player1.wide_receiver?).to eq(true)
      expect(player2.wide_receiver?).to eq(false)
    end
  end

  describe "#tight_end?" do
    it "should only return true if a player's position is tight end" do
      player1 = Player.new(position: "Tight End")
      player2 = Player.new(position: "Quarterback")

      expect(player1.tight_end?).to eq(true)
      expect(player2.tight_end?).to eq(false)
    end
  end

end