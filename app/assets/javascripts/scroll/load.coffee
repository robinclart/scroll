$(document).on "ready page:change", ->

  $("[data-load]").off "click"

  $("[data-load]").on "click", (event) ->
    event.preventDefault()
    self = $(this)
    target = $("#" + self.data("load"))
    $.get self.attr("href"), (data) ->
      target.html data
      $(document).trigger("page:change")
