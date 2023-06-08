require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = User.create(name: 'John Doe', photo: 'live to photo', bio: 'live to bio', post_counter: 0)
    @post = Post.create(title: 'My post', text: 'Post body', author: @user, comment_counter: 0, likes_counter: 0)
  end

  describe 'validations' do
    it 'should require a title' do
      post = Post.new(text: 'Post body', author: @user)
      expect(post.valid?).to eq(false)
    end

    it 'should require a non-empty title' do
      post = Post.new(title: '', text: 'Post body', author: @user)
      expect(post.valid?).to eq(false)
    end

    it 'should allow valid attributes' do
      post = Post.new(title: 'My post', text: 'Post body', author: @user, comment_counter: 0, likes_counter: 0)
      expect(post.valid?).to eq(true)
    end

    it 'should validate the comment_counter attribute' do
      post = Post.new(title: 'My post', text: 'Post body', author: @user, comment_counter: -1, likes_counter: 0)
      expect(post.valid?).to eq(false)
    end

    it 'should validate the likes_counter attribute' do
      post = Post.new(title: 'My post', text: 'Post body', author: @user, comment_counter: 0, likes_counter: -1)
      expect(post.valid?).to eq(false)
    end

    it 'does not allow title to exceed maximum length' do
      post = Post.new(title: 'a' * 251, text: 'Post body', author: @user, comment_counter: 0, likes_counter: 0)
      expect(post).not_to be_valid
    end
  end

  describe 'recent_five_comments' do
    let(:post) { @post }
    let!(:comment1) { Comment.create(author: @user, post:) }
    let!(:comment2) { Comment.create(author: @user, post:) }
    let!(:comment3) { Comment.create(author: @user, post:) }
    let!(:comment4) { Comment.create(author: @user, post:) }
    let!(:comment5) { Comment.create(author: @user, post:) }
    let!(:comment6) { Comment.create(author: @user, post:) }

    it 'should return the specified number of comments' do
      comment1
      comment2
      comment3
      comment4
      comment5
      comment6
      expect(post.recent_five_comments).to eq(post.comments.order(created_at: :desc).limit(5))
    end
  end
end
