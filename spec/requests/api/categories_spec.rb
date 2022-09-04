require 'swagger_helper'

RSpec.describe 'api/categories', type: :request do
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
