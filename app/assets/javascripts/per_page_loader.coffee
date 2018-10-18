class PerPageLoader
  @initialize: ->
    $body      = $('body')
    controller = $body.data('controller')
    action     = $body.data('action')

    try
      controller_instance = new window["#{controller}Controller"]()
      controller_instance[action]()
    catch error

window.PerPageLoader = PerPageLoader
