async = require('async')
app = require('express')()

bodyParser = require('body-parser')

app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())

redis = require("redis")
client = redis.createClient()

app.get '/:resource',(req,res)->
  resource = req.params.resource
  result = []
  client.keys "#{resource}*",(e,keys)->
    async.each keys, (key,cb)->
      client.hgetall key,(e,data)->
        result.push data
        cb()
    ,->
      res.json result
      
app.get '/:resource/:id',(req,res)->
  key = "#{req.params.resource}:#{req.params.id}"
  client.hgetall key,(e,data)->
    res.json e || data

app.post '/:resource/:id',(req,res)->
  key = "#{req.params.resource}:#{req.params.id}"
  client.hmset key,req.body,->
    res.json req.body

module.exports = ->
  app.listen '3000',->
    console.log "START server localhost:3000"