require 'rails_helper'
include TestFactories


describe User do
  before do
    @user = create(:user)
    @post = create(:post)
  end

  describe "#favorited(post)" do
    before do
      @post = associated_post
      @user = authenticated_user
    end

    it "returns 'nil' if the user has not favorited the post" do
      expect( @user.favorites.find_by_post_id(@post.id) ).to be nil
    end

    it "returns the appropriate favorite if it exists" do
      favorite = @user.favorites.create!(post: @post)
      expect( @user.favorites.find_by_post_id(@post.id) ).to eq(favorite)
    end
  end

  describe ".top_rated" do

    before do
      @user1 = create(:user)
      post = create(:post, user: @user1)
      create(:comment, user: @user1, post: post)

      @user2 = create(:user)
      post = create(:post, user: @user2)
      2.times { create(:comment, user: @user2, post: post)}
    end

    it "returns users ordered by comments + posts" do
      expect( User.top_rated ).to eq([@user2, @user1])
    end

    it "stores a 'posts_count' on user" do
      users = User.top_rated
      expect( users.first.posts_count).to eq(1)
    end

    it "stores a 'comments_count' on user" do
      users = User.top_rated
      expect( users.first.comments_count).to eq(2)
    end
  end

  describe "user_with_post_and_comment" do

    before do
      @user3 = create(:user_with_post_and_comment)
    end

    it "stores a post on user" do
        expect(@user3.posts.size).to eq(1)
    end

    it "stores a comment on user" do
      expect(@user3.comments.size).to eq(1)
    end
  end
end


