require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "POST /Create" do
    let!(:user) { create(:user) }
    let(:headers) { { "Content-Type" => "application/json" } }

    let(:valid_credentials) do
      {
        user: {
          email: user.email,
          password: user.password
        }
      }.to_json
    end

    let(:invalid_credentials) do
      {
        email: Faker::Internet.email,
        password: Faker::Internet.password
      }.to_json
    end

    context "when request is valid" do
      before { post "/api/users/login", params: valid_credentials, headers: headers }

      it "returns a 200 status code" do
        expect(response).to have_http_status(200)
      end
    end

    # context "when request is invalid" do
    #   before { post "/api/users/login", params: invalid_credentials, headers: headers }

    #   it "returns a 422 status code" do
    #     expect(response).to have_http_status(422)
    #   end
    # end
  end
end