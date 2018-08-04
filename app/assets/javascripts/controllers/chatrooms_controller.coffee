class ChatroomsController
  indexAction: ->
    $('.js-modal').modaal(
      type: 'ajax',
      background: 'white'
    )

window.ChatroomsController = ChatroomsController
