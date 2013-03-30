$(document).on "ready page:change", ->

  $(document).off "click.load.scroll"

  $(document).on "click.load.scroll", "[data-load]", (event) ->
    event.preventDefault()
    self = $(this)
    target = $(self.data("load"))
    $.get self.attr("href"), (data) ->
      target.after data
      target.remove()
      $(document).trigger("page:change")

  $(document).on "click.load.scroll", "[data-prepend]", (event) ->
    event.preventDefault()
    self = $(this)
    target = $(self.data("prepend"))
    $.get self.attr("href"), (data) ->
      target.prepend data
      $(document).trigger("page:change")

  $(document).on "click.load.scroll", "[data-append]", (event) ->
    event.preventDefault()
    self = $(this)
    target = $(self.data("append"))
    $.get self.attr("href"), (data) ->
      target.append data
      $(document).trigger("page:change")

  $(document).on "click.load.scroll", "[data-before]", (event) ->
    event.preventDefault()
    self = $(this)
    target = $(self.data("before"))
    $.get self.attr("href"), (data) ->
      target.before $(data)
      $(document).trigger("page:change")

  $(document).on "click.load.scroll", "[data-after]", (event) ->
    event.preventDefault()
    self = $(this)
    target = $(self.data("after"))
    $.get self.attr("href"), (data) ->
      target.after $(data)
      $(document).trigger("page:change")
