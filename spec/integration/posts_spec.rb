require 'swagger_helper'

describe 'Posts API' do
  path '/api/v1/posts' do
    get 'Retrieves posts for a user' do
      tags 'Posts'
      produces 'application/json'
      parameter name: :user_id, in: :query, type: :integer

      response '200', 'posts found' do
        schema type: :object,
               properties: {
                 status: { type: :string },
                 message: { type: :string },
                 data: {
                   type: :array,
                   items: {
                     type: :object,
                     properties: {
                       id: { type: :integer },
                       title: { type: :string },
                       text: { type: :string }
                     },
                     required: ['id', 'title', 'text']
                   }
                 }
               },
               required: ['status', 'message', 'data']

        let(:user) { User.create }
        let(:user_id) { user.id }
        let(:post1) { Post.create(title: 'First Post', text: 'Hello World!', user_id: user.id) }
        let(:post2) { Post.create(title: 'Second Post', text: 'Another post', user_id: user.id) }

        run_test!
      end
    end

    post 'Creates a post' do
      tags 'Posts'
      consumes 'application/json'
      parameter name: :user_id, in: :query, type: :integer
      parameter name: :post, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          text: { type: :string }
        },
        required: ['title', 'text']
      }

      response '200', 'post created' do
        let(:user) { User.create }
        let(:user_id) { user.id }
        let(:post) { { title: 'New Post', text: 'Some text' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { User.create }
        let(:user_id) { user.id }
        let(:post) { { title: 'Invalid Post' } }
        run_test!
      end
    end
  end

  path '/api/v1/posts/{id}' do
    put 'Updates a post' do
      tags 'Posts'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter name: :post, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          text: { type: :string }
        }
      }

      response '200', 'post updated' do
        let(:post) { Post.create(title: 'Test Post', text: 'Some text') }
        let(:id) { post.id }
        let(:updated_title) { 'Updated Post' }
        let(:post) { { title: updated_title } }
        run_test!
      end

      response '404', 'post not found' do
        let(:id) { 'invalid' }
        let(:post) { { title: 'Updated Post' } }
        run_test!
      end
    end
  end

  path '/api/v1/posts/{id}' do
    delete 'Deletes a post' do
      tags 'Posts'
      parameter name: :id, in: :path, type: :string

      response '200', 'post deleted' do
        let(:post) { Post.create(title: 'Test Post', text: 'Some text') }
        let(:id) { post.id }
        run_test!
      end

      response '404', 'post not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
