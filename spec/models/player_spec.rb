require 'rails_helper'

describe Player do 

  describe "associations" do 
    it { should belong_to(:team) }
    it { should have_many(:passing_game_logs) }    
  end
end