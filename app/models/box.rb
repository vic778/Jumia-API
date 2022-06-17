class Box < ApplicationRecord
  belongs_to :specification
  belongs_to :post
end
