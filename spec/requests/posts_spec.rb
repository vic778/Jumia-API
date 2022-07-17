require 'rails_helper'

RSpec.describe "Posts", type: :request do
  context "when as an admin" do
    let!(:user) { create(:user, :admin) }
    let!(:drawer) { create(:drawer) }
    # let!(:post) { create(:post, drawer: drawer) }

    describe 'it validate factory' do
      it 'should have a valid factory' do
        expect(build(:post)).to be_valid
      end
    end

    describe "GET /posts" do
      it "returns a list of posts" do
        get posts_path
        expect(response).to have_http_status(200)
      end
    end

    describe "GET /posts/:id" do
      it "returns a post" do
        get post_path(drawer)
        expect(response).to have_http_status(200)
      end
    end

    describe "PUT /posts/:id" do
      it "updates a post" do
        put post_path(drawer)
        expect(response).to have_http_status(200)
      end
    end

    describe "DELETE /posts/:id" do
      it "deletes a post" do
        delete post_path(drawer)
        expect(response).to have_http_status(200)
      end
    end

    describe "POST /posts" do
      it "creates a post" do
        post posts_path(drawer)
        expect(response).to have_http_status(200)
      end
    end
    

    
  end
end
