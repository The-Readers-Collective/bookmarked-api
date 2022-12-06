# frozen_string_literal: true

module Types
  class UserBookType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, ID
    field :book_id, ID
    field :status, Integer
    # field :books, [Types::BookType]
    field :book, Types::BookType

    def book
      Book.find(object.book_id)
    end
  end
end
