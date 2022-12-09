# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :zipcode, String
    field :email, String

    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :user_books, [Types::UserBookType]
    field :books, [Types::BookType]


    field :all_owned_books, [Types::BookType]
    field :all_bookmarked_books, [Types::BookType]

    def all_owned_books
      object.user_books.where(status: 0).map { |user_book| user_book.book}
    end

    def all_bookmarked_books
      object.user_books.where(status: 1).map { |user_book| user_book.book}
    end

  end
end
