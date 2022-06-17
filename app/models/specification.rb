class Specification < ApplicationRecord
  belongs_to :post
  has_many :boxs
end
