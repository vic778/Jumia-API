class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_post(post)
    current_item = line_items.find_by(post_id: post.id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(post: post)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum(&:total_price)
  end
end
