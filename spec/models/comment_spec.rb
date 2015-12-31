require 'rails_helper'

describe Comment do 

  describe "associations" do
    it { should belong_to(:post) }
    it { should belong_to(:user) }
  end

  describe "validations" do 
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:user) }
    it { should validate_length_of(:body).is_at_least(5) }
  end
end