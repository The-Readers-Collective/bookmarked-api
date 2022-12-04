module Types
  class MutationType < Types::BaseObject
    field :update_user, mutation: Mutations::UpdateUser
    field :destroy_user, mutation: Mutations::DestroyUser
    field :create_user, mutation: Mutations::CreateUser
  end
end
