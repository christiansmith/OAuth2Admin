'use strict';

describe 'UsersCtrl', ->

  {UsersCtrl,scope,users} = {}

  
  beforeEach module 'app.controllers'


  beforeEach inject ($injector) ->
    $controller = $injector.get '$controller'
    $rootScope = $injector.get '$rootScope'

    users = []
    scope = $rootScope.$new()

    UsersCtrl = $controller 'UsersCtrl',
      $scope: scope
      users: users


  it 'should have initial users', ->
    expect(scope.users).toBe users
