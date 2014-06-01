net = require 'net'

server  = net.createServer()
clients = 0

server.on 'connection', (socket) ->
    console.log "+ #{++clients}"

    socket.on 'close', ->
        console.log "- #{--clients}"

    socket.on 'error', (error) ->
        socket.destroy()
        console.log "Server socket error #{error}"


server.on 'error', (error) ->
    console.log "Server error #{error}"


server.listen 5050, '0.0.0.0'
console.log 'Server listening on 5050'