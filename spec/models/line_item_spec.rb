require 'rails_helper'

RSpec.describe LineItem, type: :model do
  it { should belong_to(:post) }
  it { should belong_to(:cart) }

  describe 'factory validates' do
    it 'should validate factory' do
      @cart = FactoryBot.create(:cart)
      @post = FactoryBot.create(:post)
      @line_item = FactoryBot.create(:line_item, cart: @cart, post: @post)
      expect(@line_item).to be_valid
    end
  end

  describe 'validates' do
    it 'should validate presence of post' do
      @cart = FactoryBot.create(:cart)
      @line_item = FactoryBot.create(:line_item, cart: @cart)
      expect(@line_item).to be_valid
    end

    it 'should validate presence of cart' do
      @post = FactoryBot.create(:post)
      @line_item = FactoryBot.create(:line_item, post: @post)
      expect(@line_item).to be_valid
    end
  end
end
