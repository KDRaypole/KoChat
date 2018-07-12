class AddPositionToChatrooms < ActiveRecord::Migration[5.2]
  def change
    add_column :chatrooms, :position, :integer
  end
end
