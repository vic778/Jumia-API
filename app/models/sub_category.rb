class SubCategory < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  belongs_to :category, inverse_of: :sub_categories
  has_many :drawers

  validates :category_id, presence: true, uniqueness: { scope: :name }
  validates :name, presence: true, uniqueness: true
end
