require 'rails_helper'

RSpec.describe Drawer, type: :model do
  it { should belong_to(:sub_category) }
  it { is_expected.to validate_presence_of(:name) }

  describe 'factory validates' do
    it 'should validate factory' do
      @sub_category = FactoryBot.create(:sub_category)
      @drawer = FactoryBot.create(:drawer, sub_category: @sub_category)
      expect(@drawer).to be_valid
    end
  end
end
