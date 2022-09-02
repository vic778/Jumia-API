require 'swagger_helper'

RSpec.describe 'api/categories', type: :request do
    path '/api/categories' do
        post 'Creates a category' do
            tags 'Categories'
            consumes 'application/json', 'application/xml'
            parameter name: :category, in: :body, schema: {
                type: :object,
                properties: {
                    name: { type: :string }
                },
                required: [ 'name' ]
            }
            response '201', 'category created' do
                let(:category) { { name: 'PC & Phones', description: 'Test Description', image: 'Test Image' } }
                let(:category) { { name: 'PC & Phones', description: 'Test Description', image: 'Test Image' } }
                run_test!
            end
            response '422', 'invalid request' do
                let(:category) { { name: 'foo' } }
                run_test!
            end
        end
    end

    path '/api/categories/' do
        get 'Retrieves all categories' do
            tags 'Categories'
            produces 'application/json', 'application/xml'
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
            response '404', 'categories not found' do
                run_test!
            end
        end
    end

    path '/api/categories/{id}' do
        get 'Retrieves a category' do
            tags 'Categories'
            produces 'application/json', 'application/xml'
            parameter name: :id, :in => :path, :type => :string
            response '200', 'category found' do
                schema type: :object,
                    properties: {
                        id: { type: :integer },
                        name: { type: :string }
                    },
                    required: [ 'id', 'name' ]
                let(:id) { Category.create(name: 'PC & Phones').id }
                run_test!
            end
            response '404', 'category not found' do
                let(:id) { 'invalid' }
                run_test!
            end
            response '406', 'unsupported accept header' do
                let(:'Accept') { 'application/foo' }
                run_test!
            end
        end
    end
            

end
