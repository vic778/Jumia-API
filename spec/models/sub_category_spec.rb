require 'rails_helper'

RSpec.describe SubCategory, type: :model do
  it { should belong_to(:category) }
  it { is_expected.to validate_presence_of(:name) }

  describe 'factory validates' do
    it 'should validate factory' do
      @category = FactoryBot.create(:category)
      @sub_category = FactoryBot.create(:sub_category, category: @category)
      expect(@sub_category).to be_valid
    end
  end

  describe 'validates' do
    it 'should validate name' do
      @category = create(:category)
      @sub_category = build(:sub_category, category: @category)
      expect(@sub_category).to be_valid
    end
  end
end
