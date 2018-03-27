class Pipe < ApplicationRecord
  belongs_to :category
  has_many :pipe_descr
end
