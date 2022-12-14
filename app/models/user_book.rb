class UserBook < ApplicationRecord
  enum status: {OWNED: 0, BOOKMARKED: 1}
  belongs_to :user
  belongs_to :book

  validates_presence_of :status
end
