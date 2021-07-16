class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
  end

  def my_requests
    @friend_requests = current_user.inverse_friendships
  end

  def my_friends
    @user_friends = current_user.friends
  end
end
