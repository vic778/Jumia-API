require 'swagger_helper'

RSpec.xdescribe 'api/categories', type: :request do
  context 'when as an admin' do
    path '/api/categories' do
      post 'Creates a category' do
        tags 'Categories'
        security [bearer_auth: []]
        consumes 'application/json'
        parameter name: :category, in: :body, schema: {
          type: :object,
          properties: {
            category: {
              type: :object,
              properties: {
                name: { type: :string }
              },
              required: %w[name]
            }
          },
          required: ['category']
        }
        response '201', 'category created' do
          let(:category) { { category: { name: 'victor' } } }
          run_test!
        end
      end
    end

    path '/api/categories/{id}' do
      put 'Updates a category' do
        tags 'Categories'
        security [bearer_auth: []]
        consumes 'application/json'
        parameter name: :id, in: :path, type: :string
        parameter name: :category, in: :body, schema: {
          type: :object,
          properties: {
            category: {
              type: :object,
              properties: {
                name: { type: :string }
              },
              required: %w[name]
            }
          },
          required: ['category']
        }
        response '200', 'category updated' do
          let(:category) { { category: { name: 'victor' } } }
          run_test!
        end
      end

      delete 'Deletes a category' do
        tags 'Categories'
        security [bearer_auth: []]
        consumes 'application/json'
        parameter name: :id, in: :path, type: :string
        response '204', 'category deleted' do
          run_test!
        end
      end
    end
  end

  context 'when as a user' do
    path '/api/categories' do
      get 'Retrieves all categories' do
        tags 'Categories'
        produces 'application/json'
        response '200', 'categories found' do
          schema type: :array,
                 items: {
                   type: :object,
                   properties: {
                     id: { type: :integer },
                     name: { type: :string },
                     created_at: { type: :string },
                     updated_at: { type: :string }
                   }
                 }
          run_test!
        end
      end
    end

    path '/api/categories/{id}' do
      get 'Retrieves a category' do
        tags 'Categories'
        produces 'application/json'
        parameter name: :id, in: :path, type: :string
        response '200', 'category found' do
          schema type: :object,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   created_at: { type: :string },
                   updated_at: { type: :string }
                 }
          run_test!
        end
      end
    end
  end
end
