require 'rails_helper'

describe User do 

  describe "associations" do 
    it { should have_many(:posts) }  
    it { should have_many(:comments) } 
    it { should have_many(:articles) }   
  end
end