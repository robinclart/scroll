#= require scroll/modal
#= require scroll/load
#= require scroll/reload
#= require scroll/remove
#= require scroll/form
#= require scroll/commands
#= require scroll/selectable

$(document).ready ->

  $("#scroll").prependTo("body")

  $("#show_scroll_admin").click (event) ->
    event.preventDefault()
    $("#scroll_admin").slideToggle(150)
