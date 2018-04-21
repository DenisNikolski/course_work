class PipeDescr < ApplicationRecord
  belongs_to :pipe
  has_many :shopping_cart_items
  validates :diameter, presence: true
  validates :wall_thickness, presence: true
  validates :price, presence: true

end
