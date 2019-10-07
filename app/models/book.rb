class Book < ApplicationRecord
  has_many :reviews
  has_many :book_statuses
  has_many :requests
  has_many :readed_users, through: :book_statuses, class_name: "User"
end
