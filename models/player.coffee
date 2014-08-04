{spawn, exec} = require('child_process')
events = require('events')
util = require('util')


class Player extends events.EventEmitter
  constructor: ->
    @process = spawn('mplayer', ['-input', 'file=mp_pipe', '-idle'])
    @process.on 'exit', (code, sig) =>
      @emit 'complete'

  exit: ->
    if @process
      @process.kill('SIGTERM')
    @emit 'stop'

  playStream: (streamURL) ->
    exec "echo 'loadfile #{streamURL}' > mp_pipe"

module.exports = Player