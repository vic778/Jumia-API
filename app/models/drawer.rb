class Drawer < ApplicationRecord
  belongs_to :sub_category, inverse_of: :drawers, optional: true

  validates :name, presence: true, uniqueness: { scope: :sub_category_id }
end
