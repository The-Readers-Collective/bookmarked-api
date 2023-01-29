# frozen_string_literal: true

module Types
  class DistancesType < Types::BaseObject
    field :miles_away, Integer
    field :start_zipcode, String
    field :target_zipcode, String
    field :id, ID, null: false
    field :self, ID
    field :target, ID
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    # def :miles_away
      
    # end
  end
end
