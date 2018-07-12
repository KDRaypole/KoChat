class AddOwnerIdToChatrooms < ActiveRecord::Migration[5.2]
  def change
    add_column :chatrooms, :owner_id, :integer
  end
end
