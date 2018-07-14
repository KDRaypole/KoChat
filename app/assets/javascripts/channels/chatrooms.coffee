App.chatrooms = App.cable.subscriptions.create "ChatroomsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    active_chatroom = $("[data-behavior='messages'][data-chatroom-id='#{data.chatroom_id}']")
    chat_box = $('#chat-data')
    if active_chatroom.length > 0
      active_chatroom.append(data.message)
      chat_box.scrollTop = chat_box.scrollHeight
    else
      $("[data-behavior='chatroom-link'][data-chatroom-id='#{data.chatroom_id}']").css('color',' black')
      $("[data-behavior='chatroom-link'][data-chatroom-id='#{data.chatroom_id}']").parent().addClass('notification').addClass('blink-1')

