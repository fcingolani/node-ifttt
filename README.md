node-ifttt
==========

How it works
------------

This connect middleware exposes a fake WordPress compliant XMLRPC API, so you can use it as an endpoint for an IFTTT WordPress channel. 

This way you can create custom IFTTT actions using the Create Post action from a WordPress channel as a proxy.

Why
---

WordPress channel is the only one which allows you to use custom endpoints. It would be great if IFTTT implements a Custom channel natively.

Gotchas
-------

This middleware must be the first one the connect middleware stack.
