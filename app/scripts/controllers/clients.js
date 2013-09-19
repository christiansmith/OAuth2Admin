'use strict';

angular.module('OAuth2Admin')
  .controller('ClientsCtrl', function ($scope, clients) {
    $scope.clients = clients;
  });
