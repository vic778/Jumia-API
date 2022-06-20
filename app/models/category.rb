class Category < ApplicationRecord
  belongs_to :user
  has_many :sub_categories, dependent: :destroy
  has_many :drawers, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
