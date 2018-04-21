class ValveDescr < ApplicationRecord
  belongs_to :valve
  has_many :shopping_cart_items

  validates :radius, presence: true
  validates :pressure, presence: true
  validates :max_temperature, presence: true
  validates :price, presence: true
end
