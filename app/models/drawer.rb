class Drawer < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: %i[slugged finders]
  belongs_to :sub_category
  belongs_to :category, inverse_of: :drawers, optional: true
  has_many :posts, inverse_of: :drawer, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :sub_category_id }
end
