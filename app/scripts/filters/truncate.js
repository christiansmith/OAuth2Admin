'use strict';

angular.module('OAuth2Admin')
  .filter('truncate', function () {
    return function (str) {
      return str.substring(0, 10) + '...';
    }
  });