'use strict';

describe 'ClientsCtrl', ->

  {ClientsCtrl,scope,clients} = {}

  
  beforeEach module 'app.controllers'


  beforeEach inject ($injector) ->
    $controller = $injector.get '$controller'
    $rootScope = $injector.get '$rootScope'

    clients = []
    scope = $rootScope.$new()

    ClientsCtrl = $controller 'ClientsCtrl',
      $scope: scope
      clients: clients


  it 'should have initial clients', ->
    expect(scope.clients).toBe clients
