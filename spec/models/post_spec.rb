require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should belong_to(:drawer)}
  it {is_expected.to validate_presence_of(:title)}
  it {is_expected.to validate_presence_of(:description)}
  it {is_expected.to validate_presence_of(:model)}
  it {is_expected.to validate_presence_of(:price)}
  it {is_expected.to validate_presence_of(:connexion)}
  it {is_expected.to validate_presence_of(:cpu)}
  it {is_expected.to validate_presence_of(:gpu)}
  # it {is_expected.to validate_presence_of(:system)}
  it {is_expected.to validate_presence_of(:battery)}
  it {is_expected.to validate_presence_of(:camera)}
  it {is_expected.to validate_presence_of(:memory)}
  it {is_expected.to validate_presence_of(:display)}
  # it {is_expected.to validate_presence_of(:image)}


  describe 'factory validates' do
    it 'should validate factory' do
      @drawer = FactoryBot.create(:drawer)
      @post = FactoryBot.create(:post, drawer: @drawer)
      expect(@post).to be_valid
    end
  end

  describe 'validates' do
    it 'should validate title' do
      @post = FactoryBot.build(:post, title: nil)
      expect(@post).to_not be_valid
    end
    it 'should validate description' do
      @post = FactoryBot.build(:post, description: nil)
      expect(@post).to_not be_valid
    end
    it 'should validate model' do
      @post = FactoryBot.build(:post, model: nil)
      expect(@post).to_not be_valid
    end
    it 'should validate price' do
      @post = FactoryBot.build(:post, price: nil)
      expect(@post).to_not be_valid
    end
    it 'should validate connexion' do
      @post = FactoryBot.build(:post, connexion: nil)
      expect(@post).to_not be_valid
    end
    it 'should validate cpu' do
      @post = FactoryBot.build(:post, cpu: nil)
      expect(@post).to_not be_valid
    end
    it 'should validate gpu' do
      @post = FactoryBot.build(:post, gpu: nil)
      expect(@post).to_not be_valid
    end
    # it 'should validate system' do
    #   @post = FactoryBot.build(:post, system: nil)
    #   expect(@post).to_not be_valid
    # end
    it 'should validate battery' do
      @post = FactoryBot.build(:post, battery: nil)
      expect(@post).to_not be_valid
    end
    it 'should validate camera' do
      @post = FactoryBot.build(:post, camera: nil)
      expect(@post).to_not be_valid
    end
    it 'should validate memory' do
      @post = FactoryBot.build(:post, memory: nil)
      expect(@post).to_not be_valid
    end
    it 'should validate display' do
      @post = FactoryBot.build(:post, display: nil)
      expect(@post).to_not be_valid
    end

  end
    
end
