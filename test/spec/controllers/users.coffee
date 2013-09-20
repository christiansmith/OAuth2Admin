'use strict';

describe 'UsersCtrl', ->

  {UsersCtrl,scope,users} = {}

  
  beforeEach module 'OAuth2Admin'


  beforeEach inject ($injector) ->
    $controller = $injector.get '$controller'
    $rootScope = $injector.get '$rootScope'

    users = []
    scope = $rootScope.$new()

    UsersCtrl = $controller 'UsersCtrl',
      $scope: scope
      users: users


  it 'should have initialize users', ->
    expect(scope.users).toBe users
