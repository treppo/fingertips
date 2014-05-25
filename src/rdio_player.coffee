Player =
  play: (trackId) ->
    R.ready ->
      R.player.play source: trackId

`export default Player`
