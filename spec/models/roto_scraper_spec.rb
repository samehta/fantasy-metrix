require 'rails_helper'

describe RotoScraper do

  describe '#extract_position' do

    it 'handles players with numbers' do
      expect(RotoScraper.extract_position('Ifeanyi Momah | Tight End | #80')).to eq('Tight End')
    end

    it 'handles players without numbers' do
      expect(RotoScraper.extract_position('Edawn Coughman | Tackle')).to eq('Tackle')
    end    
  end
end