class Following < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'

  def is_unique
    Following.where(follower_id: follower_id, followed_id: followed_id).empty?
  end
end
