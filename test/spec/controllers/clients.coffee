'use strict';

describe 'ClientsCtrl', ->

  {ClientsCtrl,scope,clients} = {}

  
  beforeEach module 'OAuth2Admin'


  beforeEach inject ($injector) ->
    $controller = $injector.get '$controller'
    $rootScope = $injector.get '$rootScope'

    clients = []
    scope = $rootScope.$new()

    ClientsCtrl = $controller 'ClientsCtrl',
      $scope: scope
      clients: clients


  it 'should have initialize clients', ->
    expect(scope.clients).toBe clients
