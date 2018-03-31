class Radiator < ApplicationRecord
  belongs_to :category
  has_many :radiator_descr

  validates :title, presence: true
  validates :img_src, presence: true
end
