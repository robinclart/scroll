$(document).on "ready page:change", ->

  selectable = $("[data-selectable]")  

  selectable.off "click.selectable.scroll"
  selectable.off "deselect.selectable.scroll"
  selectable.off "select.selectable.scroll"

  selectable.on "click.selectable.scroll", (event) ->
    event.stopPropagation() unless event.target.tagName is "A"
    self = $(this)
    self.trigger "select.selectable.scroll"

  selectable.on "deselect.selectable.scroll", (event) ->
    event.stopPropagation()
    self = $(this)
    self.removeClass self.data("selectable")
    $(document).data("selected", self)

  selectable.on "select.selectable.scroll", (event) ->
    event.stopPropagation()
    self = $(this)
    if previouslySelected = $(document).data("selected")
      previouslySelected.trigger "deselect.selectable.scroll"
    self.addClass self.data("selectable")
    $(document).data("selected", self)
