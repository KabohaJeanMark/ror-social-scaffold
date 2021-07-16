class Friendship < ApplicationRecord
  validates :user_id, presence: true
  validates :friend_id, presence: true

  belongs_to :user
  belongs_to :friend, class_name: 'User'

  def confirmation
    update_attributes(confirmed: true)
    Friendship.create(user_id: friend_id, friend_id: user_id, confirmed: true)
  end
end
