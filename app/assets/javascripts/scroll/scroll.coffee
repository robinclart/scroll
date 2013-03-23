#= require scroll/modal
#= require scroll/load
#= require scroll/reload
#= require scroll/edit_component
#= require scroll/actions

$(document).ready ->

  $("#scroll").prependTo("body")

  $("#show_scroll_admin").click (event) ->
    event.preventDefault()
    $("#scroll_admin").slideToggle(150)
