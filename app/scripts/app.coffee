'use strict'

angular.module('wfApp', [])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/show/:id',
        templateUrl: 'views/show.html',
        controller: 'ShowCtrl'
      .otherwise
        redirectTo: '/'
