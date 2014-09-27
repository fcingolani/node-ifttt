node-ifttt
==========

## How it works
This connect middleware exposes a fake WordPress compliant XMLRPC API, so you can use it as an endpoint for an IFTTT WordPress channel. 

This way you can create custom IFTTT actions using the Create Post action from a WordPress channel as a proxy.

## Why
WordPress channel is the only one which allows you to use custom endpoints. It would be great if IFTTT implements a Custom channel natively.

## Gotchas
This middleware must be the first one the connect middleware stack.

## Example
```bash
1) Run this application
$ node examples/basic.js

2) Simulate ifttt XMLRPC calls
$ node examples/call.js

3) Check the results
$ curl http://127.0.0.1:3001/
```

## Compiling
`node-ifttt` requires [coffeescript](http://coffeescript.org) to compile the `.coffee` files into javascript. Use the following for compiling:

```bash
$ coffee --compile --output examples/ src/examples/
$ coffee --compile --output lib/ src/lib/
```
