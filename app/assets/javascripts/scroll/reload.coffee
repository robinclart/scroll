$(document).on "reload.scroll", "[data-reload]", ->
  self = $(this)
  $.get self.data("reload"), (data) ->
    self.after $(data)
    self.remove()
    $(document).trigger("page:change")
