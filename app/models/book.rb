class Book < ApplicationRecord
  enum status: {POOR: 0, GOOD: 1, EXCELLENT: 2}
  has_many :user_books
  has_many :users, through: :user_books
end
