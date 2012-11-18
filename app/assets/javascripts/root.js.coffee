return unless location.pathname == '/'
jQuery ($) ->
  $("#send_comment").on 'click', () ->
    $.post(@form.action + '.js', $(@form).serialize())
      .success (response)->
         console.log "success"
      .error () ->
         console.log "error" # FIXME: Notice error message to user.

    return false
