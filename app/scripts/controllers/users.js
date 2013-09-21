'use strict';

angular.module('app.controllers')
  .controller('UsersCtrl', function ($scope, users) {
    $scope.users = users;
  });