return unless location.pathname == '/'
jQuery ($) ->
  s = new EventSource('/streams/comments')
  s.addEventListener 'message', (e) ->
    ((e)->
      $('#comments').append($('<li>').text(e.data))
    )(e)
  , false

  $("#send_comment").on 'click', () ->
    $.post(@form.action + '.json', $(@form).serialize())
      .success (response)->
         $("#comment_body").val('')
      .error (response) ->
         console.log response

    return false
