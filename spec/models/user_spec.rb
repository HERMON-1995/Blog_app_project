require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'John Doe', photo: 'live to photo', bio: 'live to bio', post_counter: 0) }

  before { subject.save }

  it 'validates presence of name' do
    subject.name = 'ifeanyi'
    expect(subject).to be_valid
  end

  it 'posts_counter is invalid' do
    subject.post_counter = 'asdasdasd'
    expect(subject).to_not be_valid
  end

  it 'post counter is integer' do
    subject.post_counter = -1
    expect(subject).to_not be_valid
  end

  it 'three_recent_posts' do
    subject.posts.create(title: 'Post 1', text: 'Post body', comment_counter: 0, likes_counter: 0)
    subject.posts.create(title: 'Post 2', text: 'Post body', comment_counter: 0, likes_counter: 0)
    subject.posts.create(title: 'Post 3', text: 'Post body', comment_counter: 0, likes_counter: 0)
    expect(subject.three_recent_posts.count).to eq(3)
  end
end
