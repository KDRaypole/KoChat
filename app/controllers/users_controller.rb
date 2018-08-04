class UsersController < ApplicationController
  before_action :find_user

  def show
    @followers = followers.count
    @followed = followed.count
  end

  def user_followers
    @followers = @user.followers

    respond_to do |format|
      format.html
    end
  end

  def user_chatrooms
    @chatrooms = @user.chatrooms

    respond_to do |format|
      format.html
    end
  end

  private

  def find_user
    @user = User.where(username: params[:id]).first
  end

  def followers
   Friendship.where(followed_id: @user.id)
  end

  def followed
   Friendship.where(follower_id: @user.id)
  end
end
