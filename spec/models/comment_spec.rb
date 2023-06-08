require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validation' do
    user = User.create(name: 'Amaka', photo: 'live photo', bio: 'live bio', post_counter: 0)
    post = Post.create(title: 'My post', text: 'This is my first post', author_id: user.id, comment_counter: 0,
                       likes_counter: 0)

    subject { described_class.create(text: 'This is my comment', post:, author_id: user.id) }

    it 'should be valid without a text' do
      subject.text = nil
      expect(subject).to be_valid
    end

    it 'posts comments count should increase' do
      expect(subject.post.comment_counter).to eq(post.comment_counter)
    end
  end
end
