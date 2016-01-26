require 'rails_helper'

describe User do 

  describe "associations" do 
    it { should have_many(:articles) }  
    it { should have_many(:posts).dependent(:destroy) }  
    it { should have_many(:comments).dependent(:destroy) } 
    it { should have_many(:votes).dependent(:destroy) } 
  end

  describe "validations" do 
    it { should validate_uniqueness_of(:username).case_insensitive }
  end
end