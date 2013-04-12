config = require './config'
xmlrpc = require 'xmlrpc'
crypto = require 'crypto'
                        
eventName = 'save_post'
serializedData =  """
                  [title]{{Title}}[/title] [excerpt]{{Excerpt}}[/excerpt] [imageUrl]{{ImageUrl}}[/imageUrl] [tags]{{Tags}},{{Tags2}},{{Tags3}}[/tags] [url]{{Url}}[/url] [created]{{AddedAt}}[/created]
                  """

makeRequest = (client, config)->
  post = 
    title: eventName
    description: serializedData
  
  params = [ 1, config.user, config.password, post, true]

  client.methodCall 'metaWeblog.newPost', params, (error, value)->
      console.log "metaWeblog.newPost: #{error ? value}"

console.log config

client = xmlrpc.createClient config

makeRequest(client, config) for i in [0..0]



