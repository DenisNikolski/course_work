class PipeDescr < ApplicationRecord
  belongs_to :pipe

  validates :diameter, presence: true
  validates :wall_thickness, presence: true
  validates :price, presence: true

end
