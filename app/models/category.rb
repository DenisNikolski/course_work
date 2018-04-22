class Category < ApplicationRecord
  has_many :pipes
  has_many :radiators
  has_many :valve
  validates :name, presence: true,
                   length: { minimum: 3 }
end
