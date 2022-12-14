class Mutations::Followings::DestroyFollowing < Mutations::BaseMutation
  argument :id, ID, required: true

  field :id, ID, null: true
  field :following, Types::FollowingType, null: false

  def resolve(id:)
    following = Following.find(id)
    following.destroy
    {
      id: id
    }
  end
end