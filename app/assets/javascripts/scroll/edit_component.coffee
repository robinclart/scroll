$(document).on "ready page:change", ->

  $(".edit_component").on "ajax:complete", ->
    $(this).parent().trigger("reload")
