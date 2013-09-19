'use strict';

angular.module('OAuth2Admin')
  .factory('Client', function ($q, request, host) {
    return {
      find: function () {
        return request({
          method: 'GET',
          url: host + '/v1/clients'
        });
      }
    }
  });