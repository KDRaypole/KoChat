class AddRoomSizeToChatrooms < ActiveRecord::Migration[5.2]
  def change
    add_column :chatrooms, :room_size, :integer, default: 5
  end
end
