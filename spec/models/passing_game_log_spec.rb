require 'rails_helper'

describe PassingGameLog do 

  describe "associations" do 
    it { should belong_to(:player) }    
  end
end