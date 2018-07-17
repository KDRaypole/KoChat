json.chatrooms do
  json.array!(@chatrooms) do |chatroom|
    json.name chatroom.name
    json.url display_chatrooms_path(chatroom.id)
  end
end

json.users do
  json.array!(@users) do |user|
    json.name user.username
    json.url user_path(user)
  end
end
