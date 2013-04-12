EventEmitter = require('events').EventEmitter
XMLRPCServer = require './xmlrpcServer'

extend = (obj, mixin) ->
  obj[name] = method for name, method of mixin        
  obj

parseText = (text) ->
  re = /\[(.*)\](.*)\[\/\1\]/g
  data = {}
  data[match[1]] = match[2] while match = re.exec(text)
  data

module.exports = (options = {})->
  path = options.path ? '/xmlrpc.php'
  server = new XMLRPCServer
  
  middleware = (req, res, next) -> 
    if req.method is 'POST' and req.url is path
      server.handleMethodCall req, res, next      
    else
      next()
    
  extend middleware, EventEmitter.prototype
  
  credentialsAreWrong = (params) ->
    not ( params[1] is options.user and params[2] is options.password )
  
  server.on 'mt.supportedMethods', (err, params, cb)->
    if credentialsAreWrong params
      return cb "Unauthorized"
    
    cb null, 'metaWeblog.getRecentPosts'
  
  server.on 'metaWeblog.getRecentPosts', (err, params, cb)->
    if credentialsAreWrong params
      return cb "Unauthorized"
    
    cb null, []
    
  server.on 'metaWeblog.newPost', (err, params, cb)->
    if credentialsAreWrong params
      return cb "Unauthorized"

    middleware.emit params[3].title, parseText params[3].description
    cb null, new Date().getTime()
  
  middleware
