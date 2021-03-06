// Generated by CoffeeScript 1.4.0
(function() {
  var client, config, crypto, eventName, i, makeRequest, serializedData, xmlrpc, _i;

  config = require('./config');

  xmlrpc = require('xmlrpc');

  crypto = require('crypto');

  eventName = 'save_post';

  serializedData = "[title]{{Title}}[/title] [excerpt]{{Excerpt}}[/excerpt] [imageUrl]{{ImageUrl}}[/imageUrl] [tags]{{Tags}},{{Tags2}},{{Tags3}}[/tags] [url]{{Url}}[/url] [created]{{AddedAt}}[/created]";

  makeRequest = function(client, config) {
    var params, post;
    post = {
      title: eventName,
      description: serializedData
    };
    params = [1, config.user, config.password, post, true];
    return client.methodCall('metaWeblog.newPost', params, function(error, value) {
      return console.log("metaWeblog.newPost: " + (error != null ? error : value));
    });
  };

  console.log(config);

  client = xmlrpc.createClient(config);

  for (i = _i = 0; _i <= 0; i = ++_i) {
    makeRequest(client, config);
  }

}).call(this);
