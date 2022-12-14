# frozen_string_literal: true

module Types
  class FollowingType < Types::BaseObject
    field :id, ID, null: false
    field :follower_id, ID
    field :followed_id, ID
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
