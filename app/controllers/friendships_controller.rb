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
      redirect_to current_user, notice: 'Friend request sent'
    else
      render :new, notice: 'Request not sent'
    end
  end

  def update
    @friendship = Friendship.find_by(id: params[:id])
    @friendship.update_attribute(:confirmed, true)
    if @friendship.save
      redirect_to posts_path, notice: 'Accepted friend request'
    else
      render :new, notice: 'Accept failed'
    end
  end

  def destroy
    @friendship = Friendship.find_by(id: params[:id])
    if @friendship.destroy
      redirect_to posts_path, notice: 'Deleted friend request'
    else
      render :new, notice: 'Delete failed'
    end
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id, :confirmed)
  end
end
