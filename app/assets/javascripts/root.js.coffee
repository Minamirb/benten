return unless location.pathname == '/'
jQuery ($) ->
  s = new EventSource('/streams/comments')
  s.addEventListener 'message', (e) ->
    ((e)->
      $('body').append($('<p>').text(e.data))
    )(e)
  , false


  $("#send_comment").on 'click', () ->
    $.post(@form.action + '.json', $(@form).serialize())
      .success (response)->
         console.log "success"
      .error (response) ->
         console.log response

    return false
