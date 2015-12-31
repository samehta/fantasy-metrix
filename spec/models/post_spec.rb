require 'rails_helper'

describe Post do 

  describe "associations" do
    it { should have_many(:comments).dependent(:destroy) }
    it { should belong_to(:user) }
    it { should belong_to(:topic) }
  end

  describe "validations" do 
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:topic) } 
    it { should validate_presence_of(:user) }  
    it { should validate_length_of(:title).is_at_least(5) }
    it { should validate_length_of(:body).is_at_least(20) }     
  end
end