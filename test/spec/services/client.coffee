'use strict'

describe 'Client', ->


  {Client,$httpBackend,host} = {}


  beforeEach module 'app.settings'
  beforeEach module 'app.services'


  beforeEach inject ($injector) ->
    Client = $injector.get 'Client'
    $httpBackend = $injector.get '$httpBackend'
    host = $injector.get 'host'


  afterEach ->
    $httpBackend.verifyNoOutstandingExpectation()
    $httpBackend.verifyNoOutstandingRequest()


  describe 'find', ->

    it 'should retrieve a list of clients', ->
      $httpBackend.expectGET("#{host}/v1/clients").respond null
      Client.find()
      $httpBackend.flush()


    it 'should retrieve a specific client', ->
      $httpBackend.expectGET("#{host}/v1/clients/1234").respond null
      Client.find('1234')
      $httpBackend.flush()    


  describe 'register', ->

    it 'should register a new client', ->
      url = "#{host}/v1/clients"
      client =
        email: 'valid@example.com'
        password: 'secret'
      $httpBackend.expectPOST(url, client).respond null
      Client.register client
      $httpBackend.flush()


  describe 'update', ->

    it 'should update a client', ->
      client =
        _id: '1234'
        email: 'updated@example.com'
      url = "#{host}/v1/clients/#{client._id}"
      $httpBackend.expectPUT(url, client).respond null
      Client.update client
      $httpBackend.flush()      


  describe 'destroy', ->

    it 'should remove a client', ->
      client =
        _id: '1234'
        email: 'updated@example.com'
      url = "#{host}/v1/clients/1234"
      $httpBackend.expectDELETE(url).respond null
      Client.destroy client
      $httpBackend.flush() 

