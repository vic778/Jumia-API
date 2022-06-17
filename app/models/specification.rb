class Specification < ApplicationRecord
  belongs_to :post
  has_many :boxs
  has_many :key_features
end
