'use strict';

angular.module('app.controllers')


  .controller('SessionCtrl', function ($scope, $modal, Session) {
    $scope.session = Session;

    $scope.open = function () {
      $modal.open({
        templateUrl: 'views/authenticate.html',
        windowClass: 'authenticate',
        backdrop:    'static',
        keyboard:    false,
        controller:  'AuthenticationCtrl'
      });
    }
  })


  .controller('AuthenticationCtrl', function ($scope, $modalInstance, Session) {
    
    $scope.session = Session;
    

    $scope.login = function () {
      var key = Session.key
        , secret = Session.secret
        , credentials = { key: key, secret: secret }
        ;

      function success (response) {
        $modalInstance.dismiss('cancel');
      }

      function failure (fault) {
        //
      }

      Session.login(credentials).then(success, failure);

    }


    $scope.cancel = function () {
      $modalInstance.dismiss('cancel');
    }

  });