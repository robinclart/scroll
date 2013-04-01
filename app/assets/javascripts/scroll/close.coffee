$(document).on "ready page:change", ->

  $("[data-close]").on "click", (event) ->
    self = $(this)
    event.preventDefault()
    switch self.data("close")
      when "parent"
        self.parent().remove()
      else
        self.closest(self.data("close")).remove()
