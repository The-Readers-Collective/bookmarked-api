class Mutations::Followings::CreateFollowing < Mutations::BaseMutation
  argument :follower_id, ID, required: true
  argument :followed_id, ID, required: true

  field :following, Types::FollowingType, null: false
  field :errors, [String], null: false

  def resolve(follower_id:, followed_id:)
    following = Following.new(follower_id: follower_id, followed_id: followed_id)
    if following.is_unique && following.save
      {
        following: following,
        errors: []
      }
    end
  end
end