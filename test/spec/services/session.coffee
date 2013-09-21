
describe 'Session', ->


  {Session,credentials,authorization,$httpBackend} = {}


  beforeEach module 'app.services'
  beforeEach inject ($injector) ->
    Session       = $injector.get 'Session'
    Base64        = $injector.get 'Base64'
    $httpBackend  = $injector.get '$httpBackend'
    credentials   = { key: '123', secret: 'abc' }
    authorization = Base64.encode("123:abc")
    localStorage.setItem('host', 'https://server.tld')


  afterEach ->
    $httpBackend.verifyNoOutstandingExpectation()
    $httpBackend.verifyNoOutstandingRequest()


  describe 'initial state', ->
    
    it 'should be unauthenticated', ->
      expect(Session.authenticated).toBe false

    it 'should initialize host from localStorage', ->
      expect(Session.host).toBe 'https://server.tld'

    it 'should not have a key', ->
      expect(Session.key).toBe undefined

    it 'should not have secret', ->
      expect(Session.secret).toBe undefined


  describe 'encodeCredentials', ->

    it 'should Base64 encode the key and secret', ->
      {key,secret} = credentials
      expect(Session.encodeCredentials(key, secret)).toBe authorization


  describe 'login', ->

    describe 'with unreachable host', ->


    describe 'with bad host', ->


    describe 'with valid credentials', ->

      beforeEach ->
        $httpBackend.expectPOST(Session.host, null, { 
          'Authorization': "Basic #{authorization}"
          'Accept': 'application/json, text/plain, */*' 
          'X-Requested-With':'XMLHttpRequest'
        }).respond null
        Session.login(credentials)
        $httpBackend.flush()

      it 'should authenticate the session', ->
        expect(Session.authenticated).toBe true

      it 'should set the key', ->
        expect(Session.key).toBe '123'    

      it 'should set the secret', ->
        expect(Session.secret).toBe 'abc'

      it 'should encode the authorization', ->
        expect(Session.authorization).toBe authorization


    describe 'with invalid credentials', ->



  describe 'logout', ->

    beforeEach ->
      $httpBackend.expectPOST(Session.host, null, { 
        'Authorization': "Basic #{authorization}"
        'Accept': 'application/json, text/plain, */*' 
        'X-Requested-With':'XMLHttpRequest'
      }).respond null
      Session.login(credentials)
      $httpBackend.flush()
      Session.logout()

    it 'should unauthenticate the session', ->
      expect(Session.authenticated).toBe false

    it 'should forget the key', ->
      expect(Session.key).toBe undefined

    it 'should forget the secret', ->
      expect(Session.secret).toBe undefined

    it 'should forget the authorization', ->
      expect(Session.authorization).toBe undefined


  describe 'reset', ->

    beforeEach ->
      $httpBackend.expectPOST(Session.host, null, { 
        'Authorization': "Basic #{authorization}"
        'Accept': 'application/json, text/plain, */*' 
        'X-Requested-With':'XMLHttpRequest'
      }).respond null
      Session.login(credentials)
      $httpBackend.flush()
      Session.reset()

    it 'should unauthenticate the session', ->
      expect(Session.authenticated).toBe false

    it 'should forget the host', ->
      expect(Session.host).toBe undefined
      expect(localStorage.getItem('host')).toBe null

    it 'should forget the key', ->
      expect(Session.key).toBe undefined

    it 'should forget the secret', ->
      expect(Session.secret).toBe undefined

