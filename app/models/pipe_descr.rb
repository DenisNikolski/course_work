class PipeDescr < ApplicationRecord
  belongs_to :pipe

  validates :diameter, presence: true, numericality: {greater_than: 0}
  validates :wall_thickness, presence: true, numericality: {greater_than: 0}
  validates :price, presence: true, numericality: {greater_than: 0}

end
