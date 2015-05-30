routesConfig = ($routeProvider) ->
  $routeProvider
    .when '/',
      templateUrl: 'views/homepage.html'
      controller: 'Homepage'
      controllerAs: 'Homepage'

    .when '/login',
      templateUrl: 'views/login.html'
      controller: 'Login'
      controllerAs: 'Login'

routesConfig.$inject = ['$routeProvider']

angular
  .module('socialapp')
  .config(routesConfig)
