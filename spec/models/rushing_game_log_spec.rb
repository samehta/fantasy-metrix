require 'rails_helper'

describe RushingGameLog do 

  describe "associations" do 
    it { should belong_to(:player) }    
  end

  describe "yards per carry" do
    it "should calculate yards per rushing attempt rounded to 2 decimal points" do
      rushing = create(:rushing_game_log)
      YPC = (rushing.rushing_attempts.to_f / rushing.rushing_yards.to_f).round(2)

      expect(rushing.yards_per_carry).to eq(YPC)
    end
  end
end