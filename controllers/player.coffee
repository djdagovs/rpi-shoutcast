Player = require '../models/player'
shoutcast = require '../models/shoutcast'
player = new Player()

module.exports.station = (req, res) ->
  streamID = req.params.stationID
  shoutcast.getStreams streamID, (err, streams) ->
    player.open streams[0]
    res.send 204

module.exports.stations = (req, res) ->
  genreName = req.params.genreName
  shoutcast.browseByGenre genreName, (err, stations) ->
    res.json(stations)


module.exports.pause = (req, res) ->
  player.pause()
  res.send 204