require 'rails_helper'

RSpec.describe "Specifications", type: :request do
  context "when as an admin" do
    let!(:user) { create(:user, :admin) }
    let!(:post) { create(:post) }

    describe 'it validate factory' do
      it 'should have a valid factory' do
        expect(build(:specification)).to be_valid
      end
    end

    describe "GET /specifications" do
      it "returns a list of specifications" do
        get specifications_path
        expect(response).to have_http_status(200)
      end
    end
  end
end
