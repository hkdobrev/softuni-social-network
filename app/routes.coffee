routesConfig = ($routeProvider) ->
  $routeProvider
    .when '/',
      templateUrl: 'views/feed.html'
      controller: 'FeedCtrl'
      controllerAs: 'FeedCtrl'

    .when '/login',
      templateUrl: 'views/auth.html'
      controller: 'AuthCtrl'
      controllerAs: 'AuthCtrl'

    .otherwise
      redirectTo: '/'

routesConfig.$inject = ['$routeProvider']

angular
  .module('socialapp')
  .config(routesConfig)