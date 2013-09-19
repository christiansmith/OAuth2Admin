'use strict';

angular.module('OAuth2Admin')
  .factory('User', function ($q, request, host) {
    return {
      find: function () {
        return request({
          method: 'GET',
          url: host + '/v1/users'
        });
      }
    }
  });