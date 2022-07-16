require 'rails_helper'

RSpec.describe User, type: :model do
  it { should belong_to(:role) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_presence_of(:password_confirmation) }

  describe 'factory validates' do
    it 'should validate factory' do
      expect(build(:user)).to be_valid
    end
  end

  describe 'validates' do
    it 'should validate name' do
      expect(build(:user, name: nil)).to be_invalid
    end
    it 'should validate email' do
      expect(build(:user, email: nil)).to be_invalid
    end
    it 'should validate password' do
      expect(build(:user, password: nil)).to be_invalid
    end
    it 'should validate password_confirmation' do
      expect(build(:user, password_confirmation: nil)).to be_invalid
    end
  end
end
