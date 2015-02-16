assert = require("chai").assert
rest = require('restler')
app = require('../app')()

EventSource = require('eventsource')


resource = ""
id = ""
describe "HTTP", ->
  before ->
    id = Math.round( Math.random() * 10)
    resource = Math.random().toString(36).substring(7)
  it "es",(done)->
    es = new EventSource "http://localhost:3000/#{resource}"
    es.onmessage = (e) ->
      assert.ok e.data
      done()

  it "shuld be return Array /:resource",(done)->
    rest.get "http://localhost:3000/#{resource}"
    .on 'success',(data)->
      assert.isArray data
      done()
  before (done)->
    rest.postJson "http://localhost:3000/#{resource}/#{id}",{name:"oks"}
    .on 'success',(data)->
      assert.isObject data
      done()
  it "shuld be return Object /:resource/:id",(done)->
    rest.get "http://localhost:3000/#{resource}/#{id}"
    .on 'success',(data)->
      assert.isObject data
      done()
  it "shuld be post /:resource/:id",(done)->
    rest.postJson "http://localhost:3000/#{resource}/#{id}",{name:"oks"}
    .on 'success',(data)->
      assert.isObject data
      done()