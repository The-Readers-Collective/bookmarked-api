class User < ApplicationRecord
  has_many :user_books
  has_many :books, through: :user_books
  has_many :followings, foreign_key: :follower_id
  has_many :followings, foreign_key: :followed_id

  def followings
    Following.where(follower_id: id).map do |following|
      User.find_by(id: following.followed_id)
    end
  end
end
