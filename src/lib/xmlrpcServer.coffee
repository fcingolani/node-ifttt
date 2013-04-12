###
Inspired by https://github.com/baalexander/node-xmlrpc/blob/master/lib/server.js
###

EventEmitter  = require('events').EventEmitter
Deserializer  = require 'xmlrpc/lib/deserializer'
Serializer    = require 'xmlrpc/lib/serializer'

class Server extends EventEmitter

  handleMethodCall: (req, res, next)->
    deserializer = new Deserializer
    deserializer.deserializeMethodCall req, (error, methodName, params)=>
      if @_events.hasOwnProperty methodName
        @emit methodName, null, params, (error, value)->
          if error is null
            xml = Serializer.serializeMethodResponse value 
          else
            xml = Serializer.serializeFault error
             
          res.writeHead 200,
            'Connection': 'close'
            'Content-Length': xml.length
            'Content-Type': 'text/xml'
            'Date': Date.toString()
          res.end xml

      else
        @emit 'NotFound', methodName, params
        res.writeHead 404
        res.end

module.exports = Server
