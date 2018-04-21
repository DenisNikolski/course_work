class Customer < ApplicationRecord
  has_many :shopping_carts, dependent: :delete_all
end
