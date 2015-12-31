require 'rails_helper'

describe Team do 

  describe "associations" do 
    it { should have_many(:players) }    
  end
end