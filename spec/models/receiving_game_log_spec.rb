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

    it "should return 0 if receptions and receiving yards are both equal to 0" do
      receiving = ReceivingGameLog.new(receptions: 0, receiving_yards: 0)

      expect(receiving.yards_per_reception).to eq(0)
    end

    it "should return 0 if yards per reception is equal to 0.0" do
      receiving = ReceivingGameLog.new(receptions: 5, receiving_yards: 0)

      expect(receiving.yards_per_reception).to eq(0)
    end
  end
end