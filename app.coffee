app = require('express')()

app.get '/',(req,res)->
  res.json {message:"ok"}

module.exports = ->
  app.listen '3000',->
    console.log "START server localhost:3000"