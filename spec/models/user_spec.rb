require 'rails_helper'

RSpec.describe User, type: :model do
  before(:example) do
    @user = User.create(name: 'John Doe', photo: 'live to photo', bio: 'live to bio', post_counter: 0)
  end

  describe 'validations' do
    it 'validates presence of name' do
      @user.name = 'ifeanyi'
      expect(@user).to be_valid
    end

    it 'posts_counter is invalid' do
      @user.post_counter = 'asdasdasd'
      expect(@user).to_not be_valid
    end

    it 'post counter is integer' do
      @user.post_counter = -1
      expect(@user).to_not be_valid
    end
  end
  describe 'three_recent_posts' do
    let!(:post1) do
      Post.create(title: 'Post 1', text: 'Post body', author: @user, comment_counter: 0, likes_counter: 0)
    end
    let!(:post2) do
      Post.create(title: 'Post 2', text: 'Post body', author: @user, comment_counter: 0, likes_counter: 0)
    end
    let!(:post3) do
      Post.create(title: 'Post 3', text: 'Post body', author: @user, comment_counter: 0, likes_counter: 0)
    end
    let!(:post4) { Post.create(author: @user) }

    it 'should return the specified number of posts' do
      expect(@user.three_recent_posts.count).to eq(3)
      expect(@user.three_recent_posts).to include(post1, post2, post3)
    end
  end
end
