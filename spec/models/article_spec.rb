require 'rails_helper'

describe Article do 

  describe "associations" do 
    it { should belong_to(:user) } 
  end
end