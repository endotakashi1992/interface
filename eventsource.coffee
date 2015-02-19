Readable = require('stream').Readable;

module.exports = (app)->
  app.stream = (path,cb)->
    app.get path,(req,res,next)->
      if req.headers.accept is 'text/event-stream'
        res.writeHead 200,
          'Content-Type': 'text/event-stream'
          'Cache-Control': 'no-cache'
          'Connection': 'keep-alive'
        res.write '\n'
        stream = Readable()
        stream.on 'data',(message)->
          res.write 'data: ' + message + '\n\n'
        stream.on 'exit', console.info
        stream.on 'error', console.info
        res.stream = stream
        cb(req,res,next)
      else
        next()
  return app