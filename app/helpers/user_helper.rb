module UserHelper
  def request_already_sent?(user)
    !current_user.sent_friendship_requests.where(friend_id: user.id).empty?
  end

  def already_friend?(user)
    current_user.friend?(user)
  end
end
