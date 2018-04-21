class RadiatorDescr < ApplicationRecord
  belongs_to :radiator
  has_many :shopping_cart_items

  validates :height, presence: true
  validates :length, presence: true
  validates :weight, presence: true
  validates :price, presence: true
end
