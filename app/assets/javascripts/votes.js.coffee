# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

despatcher = new WebSocketRails(window.location.host+'/websocket')

channel = despatcher.subscribe('votes')
channel.bind 'update', (story) ->
  $(".votes_count[data-id=#{story.id}]").text(story.score)