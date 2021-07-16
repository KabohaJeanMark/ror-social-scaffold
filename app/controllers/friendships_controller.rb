class FriendshipsController < ApplicationController
  def index
    @frienships = Friendships.all
  end

  def new
    @friendship = Friendship.new
  end

  def create
    @friendship = Friendship.new(friendship_params)

    if @friendship.save
      redirect_to posts_path, notice: 'Friend request sent'
    else
      redirect_to posts_path, notice: 'Request not sent'
    end
  end

  def update
    @friendship = Friendship.find_by(id: params[:id])
    @friendship.confirmation
    if @friendship.confirmation
      redirect_to my_friends_path, notice: 'Accepted friend request'
    else
      redirect_to posts_path, notice: 'Request not sent'
    end
  end

  def destroy
    @friendship = Friendship.find_by(id: params[:id])
    @friendship.delete
    redirect_to posts_path, notice: 'Deleted friend request'
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id, :confirmed)
  end
end
