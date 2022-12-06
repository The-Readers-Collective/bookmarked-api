# frozen_string_literal: true

module Types
  class UserBookType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer
    field :book_id, Integer
    field :status, Integer
    field :books, [Types::BookType]
  end
end
