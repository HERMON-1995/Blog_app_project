require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    described_class.new(
      post: Post.new(title: 'My post',
                     text: 'This is my first post',
                     author: User.new(name: 'Amaka', photo: 'live photo',
                                      bio: 'live bio', post_counter: 0), comment_counter: 0,
                     likes_counter: 0), author: User.new(name: 'Amaka',
                                                         photo: 'live photo',
                                                         bio: 'live bio', post_counter: 0)
    )
  end

  before { subject.save }

  it 'must contain an user id' do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it 'must contain post id' do
    subject.post = nil
    expect(subject).to_not be_valid
  end

  it 'should update the likes counter of the created post' do
    expect(subject.post.likes_counter).to eq(1)
  end
end
