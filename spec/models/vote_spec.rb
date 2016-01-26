require 'rails_helper'

describe Vote do

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  describe "validations" do
    it { should validate_inclusion_of(:value).in_array([-1, 1]) }
  end
end