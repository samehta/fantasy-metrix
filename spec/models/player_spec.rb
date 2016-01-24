require 'rails_helper'

describe Player do 

  describe "associations" do 
    it { should belong_to(:team) }
    it { should have_many(:passing_game_logs) }    
  end

  describe "age" do
    it "should calculate a player's age from their birth date" do  
    end
  end
end