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

    field :book, Types::BookType,  null: false do
      argument :id, ID, required: true
    end

    def book(id:)
      Book.find(id)
    end
    
  end
end
