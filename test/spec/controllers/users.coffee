'use strict';

describe 'UsersCtrl', ->

  {UsersCtrl,scope,users,host} = {}

  angular.module('app.services').value('host', 'https://whatever.net')
  beforeEach module 'app.controllers'
  beforeEach module 'app.services'


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
