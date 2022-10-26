# require 'swagger_helper'

# RSpec.describe 'api/drawers', type: :request do
#   context 'when as an admin' do
#     let!(:user) { create(:user, :admin) }

#     path '/api/categories/1/sub_categories/1/drawers' do
#       get 'Retrieves all drawers' do
#         tags 'Drawers'
#         produces 'application/json'
#         response '200', 'drawers found' do
#           schema type: :array,
#                  items: {
#                    type: :object,
#                    properties: {
#                      id: { type: :integer },
#                      name: { type: :string },
#                      created_at: { type: :string },
#                      updated_at: { type: :string }
#                    }
#                  }
#           run_test!
#         end
#       end
#     end

#     path '/api/categories/1/sub_categories/1/drawers/{id}' do
#       get 'Retrieves a drawer' do
#         tags 'Drawers'
#         produces 'application/json'
#         parameter name: :id, in: :path, type: :string
#         response '200', 'drawer found' do
#           schema type: :object,
#                  properties: {
#                    id: { type: :integer },
#                    name: { type: :string },
#                    created_at: { type: :string },
#                    updated_at: { type: :string }
#                  }
#           run_test!
#         end
#       end
#     end
#   end
# end
