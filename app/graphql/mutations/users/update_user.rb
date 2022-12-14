module Mutations
  class Users::UpdateUser < BaseMutation

    argument :attributes, Types::UserAttributes
    argument :id, ID, required: true

    field :id, ID, null: true
    field :user, Types::UserType, null: false
    field :errors, [String], null: false

    def resolve(id:, attributes:)
      user = User.find(id)
      if user.update(attributes.to_h)
        {
          user: user
        }
      else
        {
          errors: user.errors.full_messages
        }
      end

    end
  end
end
