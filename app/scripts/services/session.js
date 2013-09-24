'use strict';

angular.module('app.services')

  .factory('Session', function ($http, Base64) {

    return {

      /**
       * OAuth2Server instance URL
       */

      host: localStorage.getItem('host'),
      

      /**
       * Authentication status
       */

      authenticated: false,


      /**
       * Encode credentials
       */

      encodeCredentials: function (key, secret) {
        return Base64.encode(key + ':' + secret);
      },
      

      /**
       * Login
       */

      login: function (credentials) {
        var service = this
          , key = credentials.key
          , secret = credentials.secret
          , authorization = this.encodeCredentials(key, secret)
          ;

        function success (response) {
          service.authenticated = true;
          service.key = key;
          service.secret = secret;
          service.authorization = authorization;
          // move key and secret into private variables?
        }
 
        return $http({
          method:'POST', 
          url: this.host, 
          headers: { 
            'Authorization': 'Basic ' + authorization 
          }
        }).then(success);
      },


      /**
       * Logout
       */

      logout: function () {
        this.authenticated = false;
        delete this.key;
        delete this.secret;
        delete this.authorization;
      }, 


      /**
       * Reset
       */

      reset: function () {
        this.logout();
        delete this.host;
        localStorage.removeItem('host');
      }

    };

  });