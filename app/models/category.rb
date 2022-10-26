class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: %i[slugged finders]
  belongs_to :user
  has_many :sub_categories, dependent: :destroy
  has_many :drawers, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def slug_candidates
    [
      :name,
      %i[name]
      # [:name, :street, :city],
      # [:name, :street_number, :street, :city]
    ]
  end
end
