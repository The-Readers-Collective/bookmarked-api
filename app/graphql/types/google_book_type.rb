# frozen_string_literal: true

module Types
  class GoogleBookType < Types::BaseObject
    field :google_book_id, String
    field :book_title, String, null: false
    field :author, String
    field :isbn_13, String
    field :category, String
    field :book_cover, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
