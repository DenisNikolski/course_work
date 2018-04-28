class Valve < ApplicationRecord

  belongs_to :category
  has_many :valve_descrs, dependent: :delete_all
  include CheckImage
  validates :title, presence: true
  validates :img_src, presence: true
  validate :check_img

end
