require 'rails_helper'

RSpec.describe Role, type: :model do
  it { is_expected.to have_many(:users) }
  it { is_expected.to validate_presence_of(:name) }

  describe 'factory validates' do
    it 'should validate factory' do
      @role = FactoryBot.create(:role)
      expect(@role).to be_valid
    end
  end
end
