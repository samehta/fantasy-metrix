require 'rails_helper'

describe RotoScraper do

  describe "#extract_position" do
    it "matches players with numbers" do
      expect(RotoScraper.extract_position("Russell Wilson | Quarterback | #3")).to eq("Quarterback")
    end

    it "matches players without numbers" do
      expect(RotoScraper.extract_position("Adrian Peterson | Running Back")).to eq("Running Back")
    end    
  end
end