return unless location.pathname == '/'
jQuery ($) ->
  s = new EventSource('/comments')
  s.addEventListener 'message', (e) ->
    ((e)->
      $('body').append($('<p>').text(e.data))
    )(e)
  , false


  $("#send_comment").on 'click', () ->
    $.post(@form.action + '.js', $(@form).serialize())
      .success (response)->
         console.log "success"
      .error () ->
         console.log "error" # FIXME: Notice error message to user.

    return false
