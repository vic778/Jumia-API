require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should belong_to(:user) }
  it { is_expected.to validate_presence_of(:name) }

  describe 'factory validates' do
    it 'should validate factory' do
      expect(build(:category)).to be_valid
    end
  end

  describe 'validates' do
    it 'should validate name' do
      expect(build(:category, name: nil)).to be_invalid
    end
  end
end
