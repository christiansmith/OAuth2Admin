'use strict';

angular.module('app.controllers')
  .controller('ResourcesCtrl', function ($scope, resources) {
    $scope.resources = resources;
  });
  