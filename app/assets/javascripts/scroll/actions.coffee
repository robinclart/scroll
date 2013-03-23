$(document).on "ready page:change", ->

  $(document).off "mouseenter.actions.scroll"
  $(document).off "mouseleave.actions.scroll"

  $(document).on "mouseenter.actions.scroll", "[data-actions]", ->
    self = $(this)
    self.find(".BeforeActions").slideDown(150)
    self.find(".AfterActions").slideDown(150)

  $(document).on "mouseleave.actions.scroll", "[data-actions]", ->
    self = $(this)
    self.find(".BeforeActions").slideUp(150)
    self.find(".AfterActions").slideUp(150)
