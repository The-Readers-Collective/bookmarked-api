class Book < ApplicationRecord
  enum condition: { POOR: 0, GOOD: 1, EXCELLENT: 2 }
  has_many :user_books
  has_many :users, through: :user_books

  validates_presence_of :google_book_id, :book_title, :author,  :isbn_13, :condition
  # validates :available, inclusion: [true, false]
end
