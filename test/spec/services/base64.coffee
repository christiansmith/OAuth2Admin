'use strict'

describe 'Base64', ->

  {Base64} = {}


  beforeEach module 'app.services'
  beforeEach inject ($injector) ->
    Base64 = $injector.get 'Base64'


  describe 'encode', ->

    it 'should encode a string', ->
      expect(Base64.encode('1234')).toEqual('MTIzNA==')
