class Category < ApplicationRecord
  has_many :pipes
  has_many :radiators

  validates :name, presence: true,
            length: {minimum: 3}
end
