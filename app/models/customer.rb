class Customer < ApplicationRecord

  validates :first_name, presence: true,
                         length: { minimum: 3 }
  validates :last_name, presence: true,
                        length: { minimum: 3 }
  validates :email, presence: true
  validates :telephone, presence: true

end
