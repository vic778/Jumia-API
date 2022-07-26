require 'rails_helper'

RSpec.describe "SubCategories", type: :request do
  context "when as an admin" do
    let!(:user) { create(:user, :admin) }
    let!(:category) { create(:category) }
    let!(:sub_category) { create(:sub_category, category: category) }

    describe 'It validates Factory' do
      it 'should validate Factory' do
        expect(build(:category, :sub_category)).to be_valid
      end
    end

    describe "GET /sub_categories" do
      it "returns a list of sub_categories" do
        get "/api/categories/#{category.id}/sub_categories"
        expect(response).to have_http_status(200)
      end
    end

    describe "GET /sub_categories/:id" do
      it "returns a sub_category" do
        get "/api/categories/#{category.id}/sub_categories/#{sub_category.id}"
        expect(response).to have_http_status(200)
      end
    end

    describe "PUT /sub_categories/:id" do
      it "updates a sub_category" do
        put "/api/categories/#{category.id}/sub_categories/#{sub_category.id}"
        expect(response).to have_http_status(200)
      end
    end

    describe "DELETE /sub_categories/:id" do
      it "deletes a sub_category" do
        delete "/api/categories/#{category.id}/sub_categories/#{sub_category.id}"
        expect(response).to have_http_status(200)
      end
    end

    describe "POST /sub_categories" do
      it "creates a sub_category" do
        post "/api/categories/#{category.id}/sub_categories"
        expect(response).to have_http_status(200)
      end
    end
  end
end
