class RadiatorDescr < ApplicationRecord
  belongs_to :radiator

  validates :height, presence: true
  validates :length, presence: true
  validates :weight, presence: true
  validates :price, presence: true
end
