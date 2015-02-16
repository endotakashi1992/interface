redis = require("redis")
async = require('async')
client = redis.createClient()

obj = {name:"hello",friends:[1,2,3]}
client.hmset "ok1",obj,redis.print
client.hmset "ok2",obj,redis.print
client.hmset "ok3",obj,redis.print

result = []
client.keys "ok*",(e,keys)->
  async.each keys, (key,cb)->
    client.hgetall key,(e,data)->
      result.push data
      cb()
  ,->
    console.log result
# setTimeout ->
#   console.log result
# ,500

# client.hgetall "ok",(e,data)->
#   console.log e,data