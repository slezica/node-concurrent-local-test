net = require 'net'

n_sockets  = parseInt process.argv[2]
connected  = 0
connecting = 0

spawn = ->
    socket = new net.Socket

    connecting++
    established = false

    socket.connect 5050

    socket.on 'connect', ->
        connecting--
        established = true
    
    socket.on 'error', (error) ->
        console.log "Client error #{error}"

    socket.on 'close', (has_error) ->
        if established
            connected--
        else
            connecting--


setInterval(->
    while connecting < 10 and connected < n_sockets
        spawn()
, 10)