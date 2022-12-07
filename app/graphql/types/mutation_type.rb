module Types
  class MutationType < Types::BaseObject
    field :update_user, mutation: Mutations::Users::UpdateUser
    field :destroy_user, mutation: Mutations::Users::DestroyUser
    field :create_user, mutation: Mutations::Users::CreateUser

    field :update_book, mutation: Mutations::Books::UpdateBook
    field :destroy_book, mutation: Mutations::Books::DestroyBook
    field :create_book, mutation: Mutations::Books::CreateBook

  end
end
