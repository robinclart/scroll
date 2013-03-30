$(document).on "ready page:change", ->

  $(".Form").on "ajax:complete", ->
    $(this).parent().trigger("reload")
