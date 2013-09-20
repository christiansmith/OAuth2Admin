'use strict';

angular.module('app.settings', [])
  .value('host',   'https://oauth2server-9063.onmodulus.net')
  //.value('host',   'http://localhost:3000')
  .value('key',    '9ad9372bda1596f0158a')
  .value('secret', 'ddd48de5d04f116551ca')

angular.module('OAuth2Admin', ['ui.router', 'app.services', 'app.settings'])
  .config(function ($stateProvider, $urlRouterProvider, $locationProvider) {

    $locationProvider.html5Mode(true);
    $locationProvider.hashPrefix = '!';

    $urlRouterProvider.otherwise('/');

    $stateProvider
      .state('dashboard', {
        url: '/',
        templateUrl: 'views/dashboard.html',
        controller: 'DashboardCtrl'
      })

      .state('users', {
        url: '/users',
        templateUrl: 'views/users.html',
        controller: 'UsersCtrl',
        resolve: {
          users: function (User) {
            return User.find()
          }
        }
      })

      .state('clients', {
        url: '/clients',
        templateUrl: 'views/clients.html',
        controller: 'ClientsCtrl',
        resolve: {
          clients: function (Client) {
            return Client.find()
          }
        }        
      })

      .state('resources', {
        url: '/resources',
        templateUrl: 'views/resources.html',
        controller: 'ResourcesCtrl',
        resolve: {
          resources: function (Resource) {
            return Resource.find()
          }
        }        
      })       

      .state('logs', {
        url: '/logs',
        templateUrl: 'views/logs.html',
        controller: 'LogsCtrl'
      })

      .state('settings', {
        url: '/settings',
        templateUrl: 'views/settings.html',
        controller: 'SettingsCtrl'
      })

  })

  .run(function ($rootScope, $state, $stateParams) {
    $rootScope.$state = $state;
    $rootScope.$stateParams = $stateParams;
  });