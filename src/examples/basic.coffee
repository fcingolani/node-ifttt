###
1) Run this application
$ node examples/basic.js

2) Simulate ifttt XMLRPC calls
$ node examples/call.js

3) Check the results
$ curl http://127.0.0.1:3000/
###

config  = require './config'
connect = require 'connect'
ifttt   = require '../index'

store = []

api = ifttt(config)
api.on 'do_something', (data) ->
  store.push data

app = (req, res)->
  res.end JSON.stringify store

server = connect()
server.use api
server.use app
server.listen config.port

console.log("Listening on http://#{config.host}:#{config.port}");


