class Specification < ApplicationRecord
  belongs_to :post
  has_one :box
  has_one :key_feature
end