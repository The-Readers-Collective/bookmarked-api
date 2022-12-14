class  Mutations::Users::DestroyUser <  Mutations::BaseMutation
  argument :id, ID, required: true

  field :id, ID, null: true
  field :user, Types::UserType, null: false

  def resolve(id:)
    user = User.find(id)
    user.books.destroy_all
    # user.followings.destroy_all

    user.destroy
    {
      id: id
    }
  end
end