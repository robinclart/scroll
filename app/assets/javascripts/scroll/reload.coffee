$(document).on "reload.scroll", "[data-reload]", ->
  self = $(this)
  $.get self.data("reload"), (data) ->
    self.after $(data)
    self.remove()
    self.trigger("reloaded")
    $(document).trigger("page:change")
