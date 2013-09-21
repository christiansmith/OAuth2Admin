'use strict';

angular.module('app.services')

  .factory('Resource', function ($q, request, host) {

    var baseUrl = host + '/v1/resources';

    return {

      /**
       * Find a resource or resources
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
       * Register a new resource
       */

      register: function (resource) {
        return request({
          method: 'POST',
          url: baseUrl,
          data: resource
        });
      },


      /**
       * Update a resource
       */
      
      update: function (resource) {
        return request({
          method: 'PUT',
          url: baseUrl + '/' + resource._id,
          data: resource
        });
      }, 


      /**
       * Destroy a resource
       */

      destroy: function (resource) {
        return request({
          method: 'DELETE',
          url: baseUrl + '/' + resource._id
        });
      }

    }

  });
