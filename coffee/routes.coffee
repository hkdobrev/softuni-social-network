routesConfig = ($routeProvider) ->
  $routeProvider
    .when '/',
      templateUrl: 'views/homepage.html'
      controller: 'Homepage'
      controllerAs: 'Homepage'

    .when '/login',
      templateUrl: 'views/auth.html'
      controller: 'AuthCtrl'
      controllerAs: 'AuthCtrl'

routesConfig.$inject = ['$routeProvider']

angular
  .module('socialapp')
  .config(routesConfig)
