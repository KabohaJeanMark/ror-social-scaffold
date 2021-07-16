module UserHelper
  def request_already_sent?(user)
    current_user.pending_friends.include?(user)
  end

  def already_friend?(user)
    current_user.friend?(user)
  end
end
