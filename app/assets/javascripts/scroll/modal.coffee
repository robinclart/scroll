$(document).on "ready page:change", ->

  modalLinks = $("[data-open-modal]")

  modalLinks.off "click.modal.scroll"

  modalLinks.on "click.modal.scroll", (event) ->
    event.preventDefault()
    self = $(this)
    $.get self.attr("href"), (data) ->
      modalShadow = $("<div></div>")
      modalShadow.click (event) ->
        if this is event.target
          modalShadow.remove()
      modalShadow.css
        position: "absolute"
        top: 0
        left: 0
        width: "100%"
        height: $(document).height()
      $("body").append(modalShadow)
      modalShadow.html(data)
      modalBox = $("body").find(self.data("open-modal")).last()
      modalBox.css
        position: "absolute"
        top: self.offset().top
        left: self.offset().left
        width: self.width()
