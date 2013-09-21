'use strict';

angular.module('app.services')

  .factory('request', function ($q, $http, Session) {

    /**
     * Add HTTP Basic Authentication Header
     */

    function httpBasicAuthentication (config) {
      if (!config.headers) { config.headers = {}; }
      config.headers['Authorization'] = 'Basic ' + Session.authorization;      
    }


    /**
     * Request
     */

    function request(config) {
      var deferred = $q.defer();

      httpBasicAuthentication(config);

      function success(response) {
        console.log(config, response.data);
        deferred.resolve(response.data);
      }

      function failure(fault) {
        console.log(config, fault);
        deferred.reject(fault);
      }

      $http(config).then(success, failure);
      return deferred.promise;
    }

    return request;

  });