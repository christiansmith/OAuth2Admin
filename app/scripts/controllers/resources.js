'use strict';

angular.module('OAuth2Admin')
  .controller('ResourcesCtrl', function ($scope, resources) {
    $scope.resources = resources;
  });
  