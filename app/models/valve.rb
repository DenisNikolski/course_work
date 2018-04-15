class Valve < ApplicationRecord
  belongs_to :category
  has_many :valve_descrs

  validates :title, presence: true
  validates :img_src, presence: true

end
