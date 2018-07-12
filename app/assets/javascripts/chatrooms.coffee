$(document).on "turbolinks:load", ->
  mydiv = $("#chat-data")
  mydiv.scrollTop(mydiv.prop("scrollHeight"))
  $("#new_message").on "keypress", (e) ->
    if e &&  e.keyCode == 13
      e.preventDefault()
      $(this).submit()
      mydiv = $("#chat-data")
      setTimeout ->
        mydiv.scrollTop(mydiv.prop("scrollHeight"))
      , 200
