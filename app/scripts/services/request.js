'use strict';

angular.module('app.services')

  .factory('request', function ($q, $http, Base64, key, secret) {
       
    var authorization = 'Basic ' + Base64.encode(key + ':' + secret);

    function request(config) {
      var deferred = $q.defer();

      if (!config.headers) { config.headers = {}; }
      config.headers['Authorization'] = authorization;

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