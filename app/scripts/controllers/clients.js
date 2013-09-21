'use strict';

angular.module('app.controllers', [])
  .controller('ClientsCtrl', function ($scope, clients) {
    $scope.clients = clients;
  });
