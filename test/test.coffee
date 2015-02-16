assert = require("chai").assert
rest = require('restler')
app = require('../app')()

resource = ""
id = ""
describe "HTTP", ->
  before ->
    id = 1
    resource = Math.random().toString(36).substring(7)
  it "shuld be return Array /:resource",(done)->
    rest.get "http://localhost:3000/#{resource}"
    .on 'success',(data)->
      assert.isArray data
      done()
  it "shuld be return Object /:resource/:id",(done)->
    rest.get "http://localhost:3000/#{resource}/#{id}"
    .on 'success',(data)->
      assert.isObject data
      done()