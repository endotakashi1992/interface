module.export = (req,res,next)->
  if req.headers.accept is 'text/event-stream'
    res.writeHead 200,
      'Content-Type': 'text/event-stream'
      'Cache-Control': 'no-cache'
      'Connection': 'keep-alive'
    res.write '\n'
    res.emit = (data)->
      res.write 'data: ' + data + '\n\n'
  else
    next()