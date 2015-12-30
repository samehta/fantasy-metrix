require 'rails_helper'

describe Comment do 

  describe "validations" do 
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:user) }
    it { should validate_length_of(:body).is_at_least(5) }
  end
end