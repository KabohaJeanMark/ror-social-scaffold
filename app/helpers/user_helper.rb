module UserHelper
  def request_already_sent?(user)
    !current_user.friendships.where(friend_id: user.id, confirmed: nil).empty?
  end
end
