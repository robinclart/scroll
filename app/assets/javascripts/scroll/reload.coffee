$(document).on "reload.scroll", "[data-reload]", ->
  self = $(this)
  $.get self.data("reload"), (data) ->
    self.html data
    $(document).trigger("page:change")
