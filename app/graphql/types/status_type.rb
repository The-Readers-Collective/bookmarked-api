# frozen_string_literal: true

module Types
  class StatusType < Types::BaseEnum
    value 'OWNED', "description", value: 0
    value 'BOOKMARKED', "description", value: 1
  end
end