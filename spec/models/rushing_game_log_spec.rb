require 'rails_helper'

describe RushingGameLog do 

  describe "associations" do 
    it { should belong_to(:player) }    
  end

  describe "yards per carry" do
    it "should calculate yards per rushing attempt rounded to 2 decimal points" do
      rushing = RushingGameLog.new(rushing_attempts: 15, rushing_yards: 80)

      expect(rushing.yards_per_carry).to eq(5.33)
    end
  end
end