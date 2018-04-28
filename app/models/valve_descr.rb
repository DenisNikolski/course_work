class ValveDescr < ApplicationRecord
  belongs_to :valve

  validates :radius, presence: true, numericality: {greater_than: 0}
  validates :pressure, presence: true, numericality: {greater_than: 0}
  validates :max_temperature, presence: true, numericality: {greater_than: 0}
  validates :price, presence: true, numericality: {greater_than: 0}

end
