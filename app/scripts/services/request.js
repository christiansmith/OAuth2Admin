'use strict';

angular.module('OAuth2Admin')

  .factory('request', function ($q, $http) {

    function request(config) {
      var deferred = $q.defer();

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