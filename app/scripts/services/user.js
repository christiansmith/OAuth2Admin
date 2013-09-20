'use strict';

angular.module('app.services')


  .factory('User', function ($q, request, host) {

    var baseUrl = host + '/v1/users';

    return {

      /**
       * Find a user or users
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
       * Register a new user
       */

      register: function (user) {
        return request({
          method: 'POST',
          url: baseUrl,
          data: user
        });
      },


      /**
       * Update a user
       */
      
      update: function (user) {
        return request({
          method: 'PUT',
          url: baseUrl + '/' + user._id,
          data: user
        });
      }, 


      /**
       * Destroy a user
       */

      destroy: function (user) {
        return request({
          method: 'DELETE',
          url: baseUrl + '/' + user._id
        });
      }

    }

  });