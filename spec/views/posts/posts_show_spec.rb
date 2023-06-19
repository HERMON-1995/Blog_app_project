require 'rails_helper'

RSpec.describe 'User', type: :feature, js: false do
  before :each do
    @user = User.create(name: 'Greg', photo: 'https://randomuser.me/api/portraits/men/2.jpg',
                        bio: 'Teacher in Zimbabwe')
    @first_post = Post.create(author: @user, title: 'Hello', text: 'Hi there this is my first post')
    @comment = Comment.create(post: @first_post, author: @user, text: 'Hi Tom, How are you doing!')
  end

  it 'shows the title of the post' do
    visit "/users/#{@user.id}/posts/#{@first_post.id}"
    expect(page).to have_content('Hello')
  end

  it 'shows who wrote the post' do
    user_name = Post.find_by(author: @user.name)
    visit "/users/#{@user.id}/posts/#{@first_post.id}"
    expect(page).to have_content(user_name)
  end

  it 'shows the number of likes and comments of the post' do
    visit "/users/#{@user.id}/posts/#{@first_post.id}"
    user_post = @user.posts.find_by(id: @first_post.id)
    expect(page).to have_content(user_post.comments.count)
    expect(page).to have_content(user_post.likes.count)
  end

  it 'shows the post body' do
    visit "/users/#{@user.id}/posts/#{@first_post.id}"
    expect(page).to have_content(@first_post.text)
  end
  it 'shows the username of each commentor' do
    commentor_name = Comment.find_by(author: @user.name)
    visit "/users/#{@user.id}/posts/#{@first_post.id}"
    expect(page).to have_content(commentor_name)
  end

  it 'shows the comment left by a commentor' do
    visit "/users/#{@user.id}/posts/#{@first_post.id}"
    expect(page).to have_content(@comment.text)
  end
end
