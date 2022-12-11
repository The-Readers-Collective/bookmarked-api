# frozen_string_literal: true

module Types
  class ConditionType < Types::BaseEnum
    value 'POOR', value: 0
    value 'GOOD', value: 1
    value 'EXCELLENT', value: 2
  end
end