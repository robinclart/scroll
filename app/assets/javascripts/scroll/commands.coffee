$(document).on "ready page:change", ->

  scrollCommands = $("#scroll_commands")

  $("[data-commands]").on "click", (event) ->
    self = $(this)
    commands = $(self.data("commands")).clone()
    scrollCommands.show()
    scrollCommands.html commands.show()
