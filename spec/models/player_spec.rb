require 'rails_helper'

describe Player do 

  describe "associations" do 
    it { should belong_to(:team) }    
  end
end