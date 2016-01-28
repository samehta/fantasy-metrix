require 'rails_helper'

describe Player do 

  describe "associations" do 
    it { should belong_to(:team) }
    it { should have_many(:passing_game_logs) }
    it { should have_many(:rushing_game_logs) }
    it { should have_many(:receiving_game_logs) }
    it { should have_many(:career_passing_stats) }    
  end

  describe "age" do
    it "should calculate a player's age from their birth date" do
      player = Player.new(date_of_birth: "November 1, 1991")

      expect(player.age).to eq(24)
    end
  end
end