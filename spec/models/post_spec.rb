require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    Post.new(title: 'My post', text: 'Post body',
             author: User.new(name: 'John Doe',
                              photo: 'live to photo', bio: 'live to bio',
                              post_counter: 0), comment_counter: 0, likes_counter: 0)
  end

  before { subject.save }

  it 'should require a title' do
    subject.title = nil
    expect(subject.valid?).to eq(false)
  end

  it 'should require a non-empty title' do
    subject.title = ''
    expect(subject.valid?).to eq(false)
  end

  it 'should allow valid attributes' do
    subject.title = 'Good to great'
    expect(subject.valid?).to eq(true)
  end

  it 'should validate the comment_counter attribute' do
    subject.comment_counter = 'absc'
    expect(subject.valid?).to eq(false)
  end

  it 'should validate the likes_counter attribute' do
    subject.likes_counter = 'ghjk'
    expect(subject.valid?).to eq(false)
  end

  it 'recent_five_comments' do
    subject.comments.create(text: 'Valentine')
    subject.comments.create(text: 'Lagos')
    subject.comments.create(text: 'Warri')
    subject.comments.create(text: 'Badagry')
    subject.comments.create(text: 'Ibafo')
    expect(subject.recent_five_comments.count).to eq(5)
  end
end
