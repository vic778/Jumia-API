require 'rails_helper'

RSpec.describe "Boxes", type: :request do
  context "when as an admin" do
    let!(:user) { create(:user, :admin) }
    let!(:post) { create(:post) }

    describe 'it validate factory' do
      it 'should have a valid factory' do
        expect(build(:box)).to be_valid
      end
    end
  end
end
