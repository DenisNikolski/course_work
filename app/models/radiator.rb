class Radiator < ApplicationRecord

  belongs_to :category
  has_many :radiator_descr, dependent: :delete_all
  include CheckImage
  validate :check_img
  validates :title, presence: true
  validates :img_src, presence: true
end
