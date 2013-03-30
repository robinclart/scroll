$(document).on "ready page:change", ->

  $(document).on "ajax:complete", "[data-remove]", ->
    self = $(this)
    target = $(self.data("remove"))
    target.remove()
