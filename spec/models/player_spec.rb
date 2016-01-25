require 'rails_helper'

describe Player do 

  describe "associations" do 
    it { should belong_to(:team) }
    it { should have_many(:passing_game_logs) }    
  end

  describe "age" do
    it "should calculate a player's age from their birth date" do
      player = create(:player)
      year_constant = 10000
      players_age = (Date.today.strftime('%Y%m%d').to_i - player.date_of_birth.strftime('%Y%m%d').to_i) / year_constant

      expect(player.age).to eq(players_age)
    end
  end
end