'use strict';

angular.module('app.controllers')
  .controller('UsersCtrl', function ($scope, users, User) {
    $scope.users = users;

    $scope.destroy = function (user) {
      function success (response) {
        $scope.users.splice($scope.users.indexOf(user), 1);
      }

      User.destroy(user).then(success);
    };
  });