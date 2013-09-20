'use strict'

describe 'Resource', ->


  {Resource,$httpBackend,host} = {}


  beforeEach module 'app.settings'
  beforeEach module 'app.services'


  beforeEach inject ($injector) ->
    Resource = $injector.get 'Resource'
    $httpBackend = $injector.get '$httpBackend'
    host = $injector.get 'host'


  afterEach ->
    $httpBackend.verifyNoOutstandingExpectation()
    $httpBackend.verifyNoOutstandingRequest()


  describe 'find', ->

    it 'should retrieve a list of resources', ->
      $httpBackend.expectGET("#{host}/v1/resources").respond null
      Resource.find()
      $httpBackend.flush()


    it 'should retrieve a specific resource', ->
      $httpBackend.expectGET("#{host}/v1/resources/1234").respond null
      Resource.find('1234')
      $httpBackend.flush()    


  describe 'register', ->

    it 'should register a new resource', ->
      url = "#{host}/v1/resources"
      resource =
        email: 'valid@example.com'
        password: 'secret'
      $httpBackend.expectPOST(url, resource).respond null
      Resource.register resource
      $httpBackend.flush()


  describe 'update', ->

    it 'should update a resource', ->
      resource =
        _id: '1234'
        email: 'updated@example.com'
      url = "#{host}/v1/resources/#{resource._id}"
      $httpBackend.expectPUT(url, resource).respond null
      Resource.update resource
      $httpBackend.flush()      


  describe 'destroy', ->

    it 'should remove a resource', ->
      resource =
        _id: '1234'
        email: 'updated@example.com'
      url = "#{host}/v1/resources/1234"
      $httpBackend.expectDELETE(url).respond null
      Resource.destroy resource
      $httpBackend.flush() 

