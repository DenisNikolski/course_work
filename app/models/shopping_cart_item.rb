class ShoppingCartItem < ApplicationRecord
  belongs_to :shopping_cart
  belongs_to :pipe_descrs
  belongs_to :valve_descrs
  belongs_to :radiator_descrs
end
