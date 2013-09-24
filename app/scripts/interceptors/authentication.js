'use strict';

angular.module('app.interceptors', [])

  .factory('AuthenticationInterceptor', function ($q, $injector) {

    var $modal;

    return {

      /**
       * Handle 401 Response
       */

      responseError: function (rejection) {
        $modal = $modal || $injector.get('$modal');

        if (rejection.status === 401) {
          $modal.open({
            templateUrl: 'views/authenticate.html',
            windowClass: 'authenticate',
            backdrop:    'static',
            keyboard:    false,
            controller:  'AuthenticationCtrl'
          });
        } 

        return $q.reject(rejection);
      }

    };

  });