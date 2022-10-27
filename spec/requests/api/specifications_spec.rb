require 'swagger_helper'

RSpec.describe 'api/specifications', type: :request do
  context "when as a user" do
    path '/api/posts/1/specifications' do
      get 'Retrieves all specifications' do
        tags 'Specifications'
        consumes 'application/json'
        produces 'application/json'
        response '200', 'specifications found' do
          schema type: :array,
                 items: {
                   type: :object,
                   properties: {
                     id: { type: :integer },
                     post_id: { type: :integer },
                     title: { type: :string },
                     content: { type: :string },
                     created_at: { type: :string },
                     updated_at: { type: :string },
                     post: { type: :object },
                     specification_items: { type: :array }
                   },
                   required: %w[id post_id title content created_at updated_at post specification_items]
                 }
          run_test!
        end
        response '401', 'unauthorized' do
          schema type: :object,
                 properties: {
                   errors: { type: :array }
                 },
                 required: ['errors']
          run_test!
        end
      end
    end
  end
end
