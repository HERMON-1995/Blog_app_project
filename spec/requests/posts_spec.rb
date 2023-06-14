require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  context 'GET /index' do
    it 'returns http success' do
      get '/users/1/posts'
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get '/users/1/posts'
      expect(response).to render_template('index')
    end

    it 'should include correct placeholder' do
      get '/users/1/posts'
      expect(response.body).to include('<h1>Here is a list of posts</h1>')
    end
  end

  context 'GET /show' do
    it 'returns http success' do
      get '/users/1/posts/1'
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get '/users/1/posts/1'
      expect(response).to render_template('show')
    end

    it 'should include correct placeholder' do
      get '/users/1/posts/1'
      expect(response.body).to include('<h1>Here is a list of posts for users</h1>')
    end
  end
end
