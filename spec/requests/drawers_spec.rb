require 'rails_helper'

RSpec.describe "Drawers", type: :request do
  context "when as an admin" do
    let!(:user) { create(:user, :admin) }
    let!(:sub_category) { create(:sub_category) }
    let!(:category) { create(:category) }
    let!(:drawer) { create(:drawer, category: category, sub_category: sub_category) }

    describe 'It validates Factory' do
      it 'should validate Factory' do
        expect(build(:category, :sub_category, :drawer)).to be_valid
      end
    end

    describe "GET /drawers" do
      it "returns a list of drawers" do
        get "/api/categories/#{category.id}/sub_categories/#{sub_category.id}/drawers"
        expect(response).to have_http_status(200)
      end
    end

    describe "GET /drawers/:id" do
      it "returns a drawer" do
        get "/api/categories/#{category.id}/sub_categories/#{sub_category.id}/drawers/#{drawer.id}"
        expect(response).to have_http_status(200)
      end
    end

    describe "PUT /drawers/:id" do
      it "updates a drawer" do
        put "/api/categories/#{category.id}/sub_categories/#{sub_category.id}/drawers/#{drawer.id}"
        expect(response).to have_http_status(200)
      end
    end

    describe "DELETE /drawers/:id" do
      it "deletes a drawer" do
        delete "/api/categories/#{category.id}/sub_categories/#{sub_category.id}/drawers/#{drawer.id}"
        expect(response).to have_http_status(200)
      end
    end

    describe "POST /drawers" do
      it "creates a drawer" do
        post "/api/categories/#{category.id}/sub_categories/#{sub_category.id}/drawers"
        expect(response).to have_http_status(200)
      end
    end
  end
end
