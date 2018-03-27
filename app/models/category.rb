class Category < ApplicationRecord
  has_many :pipes

  validates :name, presence: true,
                   length: { minimum: 3 }
end
