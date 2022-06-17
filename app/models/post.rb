class Post < ApplicationRecord
  belongs_to :drawer
  has_many :specifications, inverse_of: :post, dependent: :destroy
  has_many :boxs
  has_many :key_features, inverse_of: :post, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :model, presence: true, uniqueness: true
  validates :price, presence: true
  validates :connexion, presence: true
  validates :cpu, presence: true
  validates :gpu, presence: true
  validates :system, presence: true
  validates :battery, presence: true
  validates :camera, presence: true
  validates :memory, presence: true
  validates :display, presence: true
  # validates :image, presence: true
end
