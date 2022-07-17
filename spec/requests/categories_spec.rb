require 'rails_helper'

RSpec.describe "Categories", type: :request do
  context "when as an admin" do
    let!(:user) { create(:user, :admin) }
    let!(:category) { create(:category) }

    describe 'It validates Factory' do
      it 'should validate Factory' do
        expect(build(:category)).to be_valid
      end
    end


    describe "GET /categories" do
      it "returns a list of categories" do
        get categories_path
        expect(response).to have_http_status(200)
      end
    end

    describe "GET /categories/:id" do
      it "returns a category" do
        get category_path(category)
        expect(response).to have_http_status(200)
      end
    end

    describe "PUT /categories/:id" do
      it "updates a category" do
        put category_path(category)
        expect(response).to have_http_status(200)
      end
    end

    describe "DELETE /categories/:id" do
      it "deletes a category" do
        delete category_path(category)
        expect(response).to have_http_status(200)
      end
    end

    describe "POST /categories" do
      it "creates a category" do
        post categories_path(category)
        expect(response).to have_http_status(200)
      end
    end
    
  end
  
end
