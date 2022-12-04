# frozen_string_literal: true

module Types
  class BookType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer
    field :google_book_id, String
    field :book_title, String
    field :author, String
    field :isbn_13, String
    field :condition, String
    field :genre, String
    field :book_cover, String
    field :status, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
