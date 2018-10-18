class ChatroomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatroom, only: [:show, :edit, :update, :destroy]

  def index
    @chatrooms = Chatroom.all
  end

  def show
    @messages = @chatroom.messages.order(created_at: :desc).limit(20).reverse
  end

  def new
    @chatroom = Chatroom.new
  end

  def edit
    if !current_user.admin_for(@chatroom)
      redirect_back fallback_location: root_url, notice: "You do not own this chatroom"
    end
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)

    if @chatroom.save
      redirect_to chatrooms_path, notice: 'Chatroom was successfully created.'
    else
      render :new
    end
  end

  def update
    if @chatroom.update(chatroom_params)
      redirect_to @chatroom, notice: 'Chatroom was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @chatroom.destroy
    redirect_to chatrooms_url, notice: "Chatroom was successfully destroyed."
  end

  private
    def set_chatroom
      @chatroom = Chatroom.find(params[:id])
    end

    def chatroom_params
      params.require(:chatroom).permit(:name, :room_size, :owner_id)
    end
end
