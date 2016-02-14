require 'rails_helper'

describe NflTeam do 

  describe "associations" do 
    it { should have_many(:nfl_players) }    
  end
end