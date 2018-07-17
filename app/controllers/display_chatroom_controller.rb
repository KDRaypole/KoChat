class DisplayChatroomsController < ApplicationController
  before_action :find_chatroom

  def show
    @chatroom
  end

  private

  def find_chatroom
    @chatroom = Chatroom.find(params[:format])
  end
end
