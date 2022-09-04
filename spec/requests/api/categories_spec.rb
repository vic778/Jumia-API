require 'swagger_helper'

RSpec.describe 'api/categories', type: :request do
  let(:user) { create(:user) }
  let(:Authorization) { JsonWebToken.encode(user_id: user.id) }

  path '/api/categories/' do
    get 'Retrieves categories' do
      tags 'Categories'
      produces 'application/json', 'application/xml'

      response '200', 'categories found' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string }
                 },
                 required: %w[id name]
               }

        run_test!
      end
    end
  end

  path '/api/categories/{id}' do
    get 'Retrieves a category' do
      tags 'Categories'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'category found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string }
               },
               required: %w[id name]

        let(:id) { Category.create(name: 'FOOD').id }
        run_test!
      end

      response '404', 'category not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:Accept) { 'application/foo' }
        run_test!
      end
    end
  end

  path '/api/categories' do
    post 'Creates a category' do
      tags 'Categories'
      consumes 'application/json', 'application/xml'
      security [bearerAuth: []]
      parameter name: :category, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: ['name']
      }

      response '201', 'category created' do
        let(:category) { { name: 'FOOD' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:category) { { name: 'food' } }
        run_test!
      end
    end
  end
end
