require 'rails_helper'

describe ReceivingGameLog do 

  describe "associations" do 
    it { should belong_to(:player) }    
  end

  describe "yards per reception" do
    it "should calculate yards per reception rounded to 1 decimal point" do
      receiving = ReceivingGameLog.new(receptions: 8, receiving_yards: 100)

      expect(receiving.yards_per_reception).to eq(12.5)
    end
  end
end