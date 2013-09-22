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


  afterEach ->
    $httpBackend.verifyNoOutstandingExpectation()
    $httpBackend.verifyNoOutstandingRequest()


  describe 'headers', ->

    describe 'with authenticated session', ->

      beforeEach ->
        headers = 
          'Authorization': "Basic #{authorization}"
          'Accept': 'application/json, text/plain, */*'
          'X-Requested-With': 'XMLHttpRequest'

      it 'should include an encoded authorization header', ->
        $httpBackend.expectGET(url, headers).respond null
        request({
          method: 'GET'
          url: url
        })
        $httpBackend.flush()


    describe 'with unauthenticated session', ->

      beforeEach ->      
        Session.logout()
        
      it 'should not include an Authorization header', ->
        fn = (headers) -> headers['Authorization'] is undefined
        $httpBackend.expect('GET', url, null, fn).respond null
        request({
          method: 'GET'
          url: url
        })
        $httpBackend.flush()        
