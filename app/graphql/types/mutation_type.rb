module Types
  class MutationType < Types::BaseObject
    field :destroy_user, mutation: Mutations::DestroyUser
    field :create_user, mutation: Mutations::CreateUser
  end
end
