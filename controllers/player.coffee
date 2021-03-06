Player = require '../models/player'
shoutcast = require '../models/shoutcast'
player = new Player()

module.exports.station = (req, res) ->
  streamID = req.params.stationID
  shoutcast.getStream streamID, (err, stream) ->
    player.open stream
    res.send 204

module.exports.stations = (req, res) ->
  genreName = req.params.genreName
  shoutcast.browseByGenre genreName, (err, stations) ->
    res.json(stations)

module.exports.genres = (req, res) ->
  genres = shoutcast.getGenres()
  res.json(genres)

module.exports.pause = (req, res) ->
  player.pause()
  res.send 204

module.exports.nowPlaying = (req, res) ->
  shoutcast.getCurrentTrack  (err, currentStation) ->
    res.json({ station: currentStation, isPlaying: player.isPlaying() })