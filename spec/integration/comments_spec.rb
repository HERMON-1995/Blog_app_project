require 'swagger_helper'

describe 'Comments API' do
  path '/api/v1/comments' do
    post 'Creates a comment' do
      tags 'Comments'
      consumes 'application/json'
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          text: { type: :string }
        },
        required: ['text']
      }

      response '200', 'comment created' do
        let(:comment) { { text: 'Great post!' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:comment) { { text: '' } }
        run_test!
      end
    end
  end

  path '/api/v1/comments/{id}' do
    get 'Retrieves a comment' do
      tags 'Comments'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'comment found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 text: { type: :string }
               },
               required: ['id', 'text']

        let(:comment) { Comment.create(text: 'Great post!') }
        let(:id) { comment.id }
        run_test!
      end

      response '404', 'comment not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/api/v1/comments/{id}' do
    put 'Updates a comment' do
      tags 'Comments'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          text: { type: :string }
        }
      }

      response '200', 'comment updated' do
        let(:comment) { Comment.create(text: 'Great post!') }
        let(:id) { comment.id }
        let(:updated_text) { 'Updated comment' }
        let(:comment) { { text: updated_text } }
        run_test!
      end

      response '404', 'comment not found' do
        let(:id) { 'invalid' }
        let(:comment) { { text: 'Updated comment' } }
        run_test!
      end
    end
  end

  path '/api/v1/comments/{id}' do
    delete 'Deletes a comment' do
      tags 'Comments'
      parameter name: :id, in: :path, type: :string

      response '200', 'comment deleted' do
        let(:comment) { Comment.create(text: 'Great post!') }
        let(:id) { comment.id }
        run_test!
      end

      response '404', 'comment not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
