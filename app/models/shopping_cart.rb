class ShoppingCart < ApplicationRecord
  # belongs_to :customer
  has_many :shopping_cart_items, dependent: :destroy

  def add_product_item(product_item, shopping_cart_id)
    current_item = shopping_cart_items.find_by(
      category_id: product_item[:category_id],
      product_id: product_item[:product_id],
      product_item_id: product_item[:product_item_id])
    if current_item
      current_item.increment(:amount, by = product_item[:amount].to_i)
    else
      current_item = shopping_cart_items.build(
        category_id: product_item[:category_id], product_id: product_item[:product_id],
        product_item_id: product_item[:product_item_id], amount: product_item[:amount],
        price: product_item[:price], shopping_cart_id: shopping_cart_id)
    end
    current_item
  end

  def total_price
    shopping_cart_items.to_a.sum(&:total_price)
  end

end
