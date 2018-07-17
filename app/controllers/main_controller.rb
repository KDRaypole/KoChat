class MainController < ApplicationController

  def index
  end

  def search
    @chatrooms = Chatroom.ransack(name_cont: params[:q]).result(distinct: true)
    @users     = User.ransack(username_cont: params[:q]).result(distinct: true)

    respond_to do |format|
      format.html {}
      format.json {
        @chatrooms = @chatrooms.limit(5)
        @users = @users.limit(5)
      }
    end
  end
end
