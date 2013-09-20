'use strict';

describe 'ResourcesCtrl', ->

  {ResourcesCtrl,scope,resources} = {}

  
  beforeEach module 'OAuth2Admin'


  beforeEach inject ($injector) ->
    $controller = $injector.get '$controller'
    $rootScope = $injector.get '$rootScope'

    resources = []
    scope = $rootScope.$new()

    ResourcesCtrl = $controller 'ResourcesCtrl',
      $scope: scope
      resources: resources


  it 'should have initialize resources', ->
    expect(scope.resources).toBe resources
