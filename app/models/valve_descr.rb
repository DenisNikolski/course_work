class ValveDescr < ApplicationRecord
  belongs_to :valve

  validates :radius, presence: true
  validates :pressure, presence: true
  validates :max_temperature, presence: true
  validates :price, presence: true
end
