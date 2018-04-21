class ShoppingCart < ApplicationRecord
  belongs_to :customer
  has_many :shopping_cart_items, dependent: :destroy
end
