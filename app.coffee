app = require('express')()

app.get '/:resource',(req,res)->
  res.json []
app.get '/:resource/:id',(req,res)->
  res.json {}

module.exports = ->
  app.listen '3000',->
    console.log "START server localhost:3000"