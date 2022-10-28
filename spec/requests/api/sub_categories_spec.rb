require 'swagger_helper'

RSpec.xdescribe 'api/sub_categories', type: :request do
  context 'when as an admin' do
    let(:user) { create(:user, :admin) }

    path '/api/categories/1/sub_categories' do
      post 'Creates a sub_category' do
        tags 'SubCategories'
        consumes 'application/json'
        security [bearer_auth: []]
        parameter name: :sub_category, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            category_id: { type: :integer }
          },
          required: %w[name category_id]
        }
        response '201', 'sub_category created' do
          let(:sub_category) { { name: 'FOOD', category_id: 1 } }
          run_test!
        end
        response '422', 'invalid request' do
          let(:sub_category) { { name: 'FOOD' } }
          run_test!
        end
      end
    end

    path '/api/categories/1/sub_categories/1' do
      put 'Updates a sub_category' do
        tags 'SubCategories'
        consumes 'application/json'
        security [bearer_auth: []]
        parameter name: :sub_category, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            category_id: { type: :integer }
          },
          required: %w[name category_id]
        }
        response '204', 'sub_category updated' do
          let(:sub_category) { { name: 'FOOD', category_id: 1 } }
          run_test!
        end
        response '422', 'invalid request' do
          let(:sub_category) { { name: 'FOOD' } }
          run_test!
        end
      end
    end

    path '/api/categories/1/sub_categories/1' do
      delete 'Deletes a sub_category' do
        tags 'SubCategories'
        security [bearer_auth: []]
        response '204', 'sub_category deleted' do
          run_test!
        end
      end
    end
  end

  path '/api/categories/1/sub_categories' do
    get 'Retrieves all sub_categories' do
      tags 'SubCategories'
      produces 'application/json'
      response '200', 'sub_categories found' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   category_id: { type: :integer },
                   created_at: { type: :string },
                   updated_at: { type: :string }
                 }
               }
        run_test!
      end
    end
  end

  path '/api/categories/1/sub_categories/{id}' do
    get 'Retrieves a sub_category' do
      tags 'SubCategories'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      response '200', 'sub_category found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 category_id: { type: :integer },
                 created_at: { type: :string },
                 updated_at: { type: :string }
               }
        run_test!
      end
    end
  end
end
