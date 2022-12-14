class User < ApplicationRecord
  has_many :user_books
  has_many :books, through: :user_books
  has_many :followings


  validates_presence_of :name, :email, :zipcode
end
