require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validation' do
    subject do
      described_class.new(text: 'This is my comment',
                          post: Post.new(title: 'My post', text: 'This is my first post',
                                         author: User.new(name: 'Amaka', photo: 'live photo',
                                                          bio: 'live bio', post_counter: 0), comment_counter: 0,
                                         likes_counter: 0),
                          author: User.new(name: 'Amaka', photo: 'live photo', bio: 'live bio',
                                           post_counter: 0))
    end

    before { subject.save }

    it 'should be valid without a text' do
      subject.text = nil
      expect(subject).to be_valid
    end

    it 'posts comments count should increase' do
      expect(subject.post.comment_counter).to eq(1)
    end
  end
end
