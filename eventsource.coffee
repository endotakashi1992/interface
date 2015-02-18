module.exports = (app)->
  app.es = (path,cb)->
    app.get path,(req,res,next)->
      if req.headers.accept is 'text/event-stream'
        res.writeHead 200,
          'Content-Type': 'text/event-stream'
          'Cache-Control': 'no-cache'
          'Connection': 'keep-alive'
        res.write '\n'
        res.emit = (message)->
          res.write 'data: ' + message + '\n\n'
        cb(req,res,next)
      else
        next()
  return app