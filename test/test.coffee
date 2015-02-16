assert = require("assert")
rest = require('restler')
app = require('../app')()

describe "HTTP", ->
  it "shuld be exist /",(done)->
    rest.get 'http://localhost:3000'
    .on 'success',(data)->
      assert.ok data
      done()