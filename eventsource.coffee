module.exports = (app)->
  app.es = (path,cb)->
    app.get path,(req,res,next)->
      if req.headers.accept is 'text/event-stream'
        cb(req,res,next)
      else
        next()
  return app