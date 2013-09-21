'use strict'

describe 'request', ->


  {url,request,authorization,headers,$httpBackend,Session,Base64} = {}


  beforeEach module 'app.services'


  beforeEach inject ($injector) ->
    url                   = 'https://host/'
    key                   = '123'
    secret                = 'secret'
    
    Session               = $injector.get 'Session'
    Session.host          = url
    Session.key           = key
    Session.secret        = secret
    Session.authorization = 
    authorization         = Session.encodeCredentials(key, secret)

    request               = $injector.get 'request'
    $httpBackend          = $injector.get '$httpBackend'

    headers = 
      'Authorization': "Basic #{authorization}"
      'Accept': 'application/json, text/plain, */*'
      'X-Requested-With': 'XMLHttpRequest'


  afterEach ->
    $httpBackend.verifyNoOutstandingExpectation()
    $httpBackend.verifyNoOutstandingRequest()


  describe 'headers', ->

    it 'should include an encoded authorization header', ->
      $httpBackend.expectGET(url, headers).respond null
      request({
        method: 'GET',
        url: url
      })
      $httpBackend.flush()