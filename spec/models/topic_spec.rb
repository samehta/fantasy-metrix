require 'rails_helper'

describe Topic do 

  describe "associations" do 
    it { should have_many(:posts).dependent(:destroy) }    
  end
end