require 'rails_helper'

describe Post do 

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:topic) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:votes).dependent(:destroy) }
  end

  describe "validations" do 
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:topic) } 
    it { should validate_presence_of(:user) }  
    it { should validate_length_of(:title).is_at_least(5) }
    it { should validate_length_of(:body).is_at_least(20) }     
  end

  describe "voting" do

    before do
      @post = create(:post)
      3.times { @post.votes.create(value: 1) }
      2.times { @post.votes.create(value: -1) }
    end

    describe "#up_votes" do
      it "counts the number of votes with value = 1" do
        expect(@post.up_votes).to eq(3)
      end
    end

    describe "#down_votes" do
      it "counts the number of votes with value = -1" do
        expect(@post.down_votes).to eq(2)
      end
    end

    describe "#points" do
      it "returns the sum of all down and up votes" do
        expect(@post.points).to eq(1)
      end
    end
  end
end