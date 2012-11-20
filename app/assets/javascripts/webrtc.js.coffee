# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

dispatcher '^/webrtc', ->
  onSuccess = (stream) ->
    video = $("#livevideo")[0]
    video.src = webkitURL.createObjectURL(stream)
    video.play()

  onError = (error) ->
    console && console.log("Error: " + error.code)

  videoOpts =
    video: true
    audio: true

  navigator.webkitGetUserMedia videoOpts, onSuccess, onError
