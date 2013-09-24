'use strict'

describe 'AuthenticationInterceptor', ->


  {AuthenticationInterceptor,Session,$modal} = {}


  beforeEach module 'ui.bootstrap'
  beforeEach module 'app.services'
  beforeEach module 'app.interceptors'


  beforeEach inject ($injector) ->
    AuthenticationInterceptor = $injector.get 'AuthenticationInterceptor'
    Session = $injector.get 'Session'
    $modal = $injector.get '$modal'


  describe 'responseError interceptor', ->

    describe 'with 401 response', ->

      beforeEach ->
        spyOn $modal, 'open'
        AuthenticationInterceptor.responseError({ status: 401 })

      it 'should open a modal window', ->
        expect($modal.open).toHaveBeenCalled()