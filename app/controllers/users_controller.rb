class UsersController < ApplicationController

  def show
    @user = User.where(username: params[:id]).first
    @followers = followers.count
    @followed = followed.count
  end

  private

  def followers
   Friendship.where(followed_id: @user.id)
  end

  def followed
   Friendship.where(follower_id: @user.id)
  end
end
