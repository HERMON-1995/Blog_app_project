require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'validation' do
    user = User.create(name: 'Amaka', photo: 'live photo', bio: 'live bio', post_counter: 0)
    post = Post.create(title: 'My post', text: 'This is my first post', author_id: user.id, comment_counter: 0,
                       likes_counter: 0)

    subject { described_class.create(post:, author_id: user.id) }

    it 'must contain an user id' do
      subject.author_id = nil
      expect(subject).to_not be_valid
    end

    it 'must contain post id' do
      subject.post_id = nil
      expect(subject).to_not be_valid
    end

    it 'should update the likes counter of the created post' do
      expect(subject.post.likes_counter).to eq(post.likes_counter)
    end
  end
end
