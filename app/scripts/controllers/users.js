'use strict';

angular.module('OAuth2Admin')
  .controller('UsersCtrl', function ($scope, users) {
    $scope.users = users;
  });