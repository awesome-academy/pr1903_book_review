class Book < ApplicationRecord
  has_many :reviews
  has_many :book_statuses
end
