Player =
  play: (trackId) ->
    R.ready ->
      R.player.play source: trackId

  togglePause: ->
    R.player.togglePause()

`export default Player`
