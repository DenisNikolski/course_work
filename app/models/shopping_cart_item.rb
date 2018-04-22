class ShoppingCartItem < ApplicationRecord
  belongs_to :shopping_cart

  def total_price
    amount * price
  end
end
