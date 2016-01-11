require 'rails_helper'

describe User do 

  describe "associations" do 
    it { should have_many(:posts).dependent(:destroy) }  
    it { should have_many(:comments).dependent(:destroy) } 
    it { should have_many(:articles) }   
  end

  describe "validations" do 
    it { should validate_uniquness_of(:username) }
  end
end