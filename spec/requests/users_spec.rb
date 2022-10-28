require 'rails_helper'

RSpec.describe "Users", type: :request do
  context "when as a admin" do
    let!(:user) { create(:user, :admin) }

    describe "GET /users" do
      it "returns a list of users" do
        get users_path
        expect(response).to have_http_status(200)
      end
    end

    # describe "GET /users/:id" do
    #   it "returns a user" do
    #     get user_path
    #     expect(response).to have_http_status(200)
    #   end
    # end

    describe "PUT /users/:id" do
      it "updates a user" do
        put user_path(user)
        expect(response).to have_http_status(200)
      end
    end
  end
end
