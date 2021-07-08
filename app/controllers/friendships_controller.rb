class FriendshipsController < ApplicationController
  def new
    @friendship = Friendship.new
  end

  def create
    @friendship = current_user.friendships.build(friendship_params)
    
    if @friendship.save
      redirect_to current_user, notice: "Friend request sent"
    else
      render :new,  notice: "Request not sent"
    end
  end

  private

  def friendship_params
    params.require(:friendship).permit(:friend_id, :confirmed) # user_id
  end
  
end
