class Customer < ApplicationRecord
  # has_many :shopping_carts

  validates :first_name, presence: true,
                         length: {minimum: 2},
                         format: {with: /\A[a-zA-Z]+\z/,
                                  message: 'only allows letters'}
  validates :last_name, presence: true,
                        length: {minimum: 2},
                        format: {with: /\A[a-zA-Z]+\z/,
                                 message: 'only allows letters'}
  validates :email, presence: true
  validates :telephone, presence: true, numericality: true,
                        format: {with: /\A375+(29|44|33|25)[1-9][0-9]{6}\z/}
end
