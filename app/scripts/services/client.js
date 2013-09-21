'use strict';

angular.module('app.services')

  .factory('Client', function ($q, request, host) {

    var baseUrl = host + '/v1/clients';

    return {

      /**
       * Find a client or clients
       */

      find: function (id) {
        var url = (id) 
          ? baseUrl + '/' + id
          : baseUrl
          ;

        return request({
          method: 'GET',
          url: url
        });
      },


      /**
       * Register a new client
       */

      register: function (client) {
        return request({
          method: 'POST',
          url: baseUrl,
          data: client
        });
      },


      /**
       * Update a client
       */
      
      update: function (client) {
        return request({
          method: 'PUT',
          url: baseUrl + '/' + client._id,
          data: client
        });
      }, 


      /**
       * Destroy a client
       */

      destroy: function (client) {
        return request({
          method: 'DELETE',
          url: baseUrl + '/' + client._id
        });
      }

    }

  });
