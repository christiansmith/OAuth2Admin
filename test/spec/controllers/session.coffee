'use strict';

describe 'SessionCtrl', ->

  {SessionCtrl,scope,Session} = {}


  beforeEach module 'ui.bootstrap'
  beforeEach module 'app.services'
  beforeEach module 'app.controllers'
  

  beforeEach inject ($injector) ->
    Session = $injector.get 'Session'
    $controller = $injector.get '$controller'
    $rootScope = $injector.get '$rootScope'


    resources = []
    scope = $rootScope.$new()

    SessionCtrl = $controller 'SessionCtrl', { $scope: scope }


  it 'should expose the Session service', ->
    expect(scope.session).toBe Session
