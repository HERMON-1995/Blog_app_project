require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context 'GET /index' do
    it 'returns http success' do
      get '/users/index'
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get '/users'
      expect(response).to render_template('index')
    end

    it 'should include correct placeholder' do
      get '/users'
      expect(response.body).to include('<h1>Here is the list of all users</h1>')
    end
  end

  context 'GET /show' do
    it 'returns http success' do
      get '/users/show'
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get '/users/show'
      expect(response).to render_template('show')
    end

    it 'should include correct placeholder' do
      get '/users/show'
      expect(response.body).to include('<h1>Here is the list of users with a given ID</h1>')
    end
  end
end
