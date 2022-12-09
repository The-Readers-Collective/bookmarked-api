module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :users, [Types::UserType], null: false
    def users
      User.all
    end

    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end
    def user(id:)
      User.find(id)
    end

    field :books, [Types::BookType], null: false
    def books
      Book.all
    end

    field :book, Types::BookType, null: false do
      argument :id, ID, required: true
    end
    def book(id:)
      Book.find(id)
    end

    field :google_books, [Types::GoogleBookType], null: false do
      argument :title, String, required: true
    end
    def google_books(title:)
      GoogleBooksFacade.books_by_name(title)
    end

    field :user_books, [Types::UserBookType], null: false
    def user_books
      UserBook.all
    end

    field :user_book, Types::UserBookType, null: false do
      argument :id, ID, required: true
    end
    def user_book(id:)
      UserBook.find(id)
    end

    field :books_by_google_book_id, [Types::BookType], null: false do
      argument :google_book_id, String, required: true
    end
    def books_by_google_book_id(google_book_id:)
      Book.where(google_book_id: google_book_id)
    end

  end
end
