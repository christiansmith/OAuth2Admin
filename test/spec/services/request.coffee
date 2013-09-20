'use strict'

describe 'request', ->


  {request,$httpBackend,host, key, secret, Base64} = {}


  beforeEach module 'app.settings'
  beforeEach module 'app.services'


  beforeEach inject ($injector) ->
    request      = $injector.get 'request'
    $httpBackend = $injector.get '$httpBackend'
    host         = $injector.get 'host'
    key          = $injector.get 'key'
    secret       = $injector.get 'secret'
    Base64       = $injector.get 'Base64'
    


  afterEach ->
    $httpBackend.verifyNoOutstandingExpectation()
    $httpBackend.verifyNoOutstandingRequest()


  describe 'headers', ->

    it 'should include an encoded authorization header', ->
      url          = 'https://localhost/'
      credentials  = "Basic #{Base64.encode(key + ':' + secret)}"
      
      headers = 
        'Authorization': credentials
        'Accept': 'application/json, text/plain, */*'
        'X-Requested-With': 'XMLHttpRequest'

      $httpBackend.expectGET(host, headers).respond null
      request({
        method: 'GET',
        url: host
      })
      $httpBackend.flush()