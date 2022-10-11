class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders, :history]
  
  belongs_to :drawer
  has_many :specifications, inverse_of: :post, dependent: :destroy
  has_many :boxs
  has_many :key_features
  has_many :cart

  validates :title, presence: true
  validates :description, presence: true
  validates :model, presence: true, uniqueness: true
  validates :price, presence: true
  validates :connexion, presence: true
  validates :cpu, presence: true
  validates :gpu, presence: true
  # validates :system, presence: true
  validates :battery, presence: true
  validates :camera, presence: true
  validates :memory, presence: true
  validates :display, presence: true
  # validates :image, presence: true
  def slug_candidates
    [
      :title,
      [:title, :model]
      # [:name, :street, :city],
      # [:name, :street_number, :street, :city]
    ]
  end

  def should_generate_new_friendly_id?
    title_changed?
  end
end
