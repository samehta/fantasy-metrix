require 'rails_helper'

describe PassingGameLog do 

  describe "associations" do 
    it { should have_many(:players) }    
  end
end