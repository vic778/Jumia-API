class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :post

  def total_price
    post.price.to_i * quantity.to_i
  end
end
