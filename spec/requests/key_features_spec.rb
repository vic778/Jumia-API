require 'rails_helper'

RSpec.describe "KeyFeatures", type: :request do
  context "when as an admin" do
    let!(:user) { create(:user, :admin) }
    let!(:post) { create(:post) }
    
    describe 'it validate factory' do
      it 'should have a valid factory' do
        expect(build(:key_feature)).to be_valid
      end
    end    
  end
end
