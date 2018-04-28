class RadiatorDescr < ApplicationRecord
  belongs_to :radiator

  validates :height, presence: true, numericality: { greater_than: 0 }
  validates :length, presence: true, numericality: { greater_than: 0 }
  validates :weight, presence: true, numericality: { greater_than: 0 }
  validates :price, presence: true, numericality: { greater_than: 0 }
end
