class ChatroomsController
  indexAction: ->
    bindIndexActions()

  bindIndexActions = ->
    $(document).on "click", "#close-x", (event) ->
      $(this).parent().fadeOut 300, ->
        $(this).remove()

window.ChatroomsController = ChatroomsController
