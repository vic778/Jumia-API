require 'rails_helper'

RSpec.describe Box, type: :model do
  it { should belong_to(:post) }
  it { should belong_to(:specification) }

  describe 'factory validates' do
    it 'should validate factory' do
      @drawer = FactoryBot.create(:drawer)
      @post = FactoryBot.create(:post, drawer: @drawer)
      @specification = FactoryBot.create(:specification, post: @post)
      @box = FactoryBot.create(:box, post: @post, specification: @specification)
      expect(@box).to be_valid
    end
  end
end
