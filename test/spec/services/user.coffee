'use strict'

describe 'User', ->


  {User,$httpBackend,host} = {}


  beforeEach module 'app.settings'
  beforeEach module 'app.services'


  beforeEach inject ($injector) ->
    User = $injector.get 'User'
    $httpBackend = $injector.get '$httpBackend'
    host = $injector.get 'host'


  afterEach ->
    $httpBackend.verifyNoOutstandingExpectation()
    $httpBackend.verifyNoOutstandingRequest()


  describe 'find', ->

    it 'should retrieve a list of users', ->
      $httpBackend.expectGET("#{host}/v1/users").respond null
      User.find()
      $httpBackend.flush()


    it 'should retrieve a specific user', ->
      $httpBackend.expectGET("#{host}/v1/users/1234").respond null
      User.find('1234')
      $httpBackend.flush()    


  describe 'register', ->

    it 'should register a new user', ->
      url = "#{host}/v1/users"
      user =
        email: 'valid@example.com'
        password: 'secret'
      $httpBackend.expectPOST(url, user).respond null
      User.register user
      $httpBackend.flush()


  describe 'update', ->

    it 'should update a user', ->
      user =
        _id: '1234'
        email: 'updated@example.com'
      url = "#{host}/v1/users/#{user._id}"
      $httpBackend.expectPUT(url, user).respond null
      User.update user
      $httpBackend.flush()      


  describe 'destroy', ->

    it 'should remove a user', ->
      user =
        _id: '1234'
        email: 'updated@example.com'
      url = "#{host}/v1/users/1234"
      $httpBackend.expectDELETE(url).respond null
      User.destroy user
      $httpBackend.flush() 

