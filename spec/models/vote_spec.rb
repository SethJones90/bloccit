require 'rails_helper'

describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        up_vote = Vote.new(value: 1)
        expect(up_vote.valid?).to eq(true)

        down_vote = Vote.new(value: -1)
        expect(down_vote.valid?).to eq(true)

        invalid_vote = Vote.new(value: 2)
        expect(invalid_vote.valid?).to eq(false)
      end
    end
  end

  describe 'after_save' do
     it "adds an up-vote to the post" do
       @user = authenticated_user
       @post = associated_post
       sign_in @user
 
       expect {
         post( :up_vote, post_id: @post.id )
       }.to change{ @post.up_votes }.by 1
     end
   end
 end