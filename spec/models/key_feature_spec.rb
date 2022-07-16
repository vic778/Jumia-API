require 'rails_helper'

RSpec.describe KeyFeature, type: :model do
  it { should belong_to(:specification) }
  it { should belong_to(:post) }


  describe 'factory validates' do
    it 'should validate factory' do
      @drawer = FactoryBot.create(:drawer)
      @post = FactoryBot.create(:post, drawer: @drawer)
      @specification = FactoryBot.create(:specification, post: @post)
      @key_feature = FactoryBot.create(:key_feature, post: @post, specification: @specification)
      expect(@key_feature).to be_valid
    end
  end

end
