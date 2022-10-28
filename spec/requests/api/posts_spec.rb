require 'swagger_helper'

RSpec.xdescribe 'api/posts', type: :request do
  context "when as a user" do
    path '/api/posts' do
      get 'Retrieves all posts' do
        tags 'Posts'
        consumes 'application/json'
        produces 'application/json'
        # parameter name: : in: :header, type: :string, required: true
        response '200', 'posts found' do
          schema type: :array,
                 items: {
                   type: :object,
                   properties: {
                     id: { type: :integer },
                     title: { type: :string },
                     content: { type: :string },
                     image: { type: :string },
                     drawer_id: { type: :integer },
                     created_at: { type: :string },
                     updated_at: { type: :string },
                     user_id: { type: :integer },
                     slug: { type: :string },
                     category_id: { type: :integer },
                     sub_category_id: { type: :integer },
                     user: { type: :object },
                     comments: { type: :array },
                     boxes: { type: :array },
                     key_features: { type: :array },
                     specifications: { type: :array },
                     drawer: { type: :object },
                     category: { type: :object },
                     sub_category: { type: :object }
                   },
                   required: %w[id title content image drawer_id created_at updated_at user_id slug category_id sub_category_id user comments boxes key_features specifications drawer category sub_category]
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

    path '/api/posts/{id}' do
      get 'Retrieves a post' do
        tags 'Posts'
        consumes 'application/json'
        produces 'application/json'
        parameter name: :id, in: :path, type: :string, required: true
        response '200', 'post found' do
          schema type: :object,
                 properties: {
                   id: { type: :integer },
                   title: { type: :string },
                   content: { type: :string },
                   image: { type: :string },
                   drawer_id: { type: :integer },
                   created_at: { type: :string },
                   updated_at: { type: :string },
                   user_id: { type: :integer },
                   slug: { type: :string },
                   category_id: { type: :integer },
                   sub_category_id: { type: :integer },
                   user: { type: :object },
                   comments: { type: :array },
                   boxes: { type: :array },
                   key_features: { type: :array },
                   specifications: { type: :array },
                   drawer: { type: :object },
                   category: { type: :object },
                   sub_category: { type: :object }
                 },
                 required: %w[id title content image drawer_id created_at updated_at user_id slug category_id sub_category_id user comments boxes key_features specifications drawer category sub_category]
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
        response '404', 'post not found' do
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
