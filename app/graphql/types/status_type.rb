# frozen_string_literal: true

module Types
  class StatusType < Types::BaseEnum
    value 'OWNED', "Books owned by user"
    value 'BOOKMARKED', "Books bookmarked by user"
  end
end