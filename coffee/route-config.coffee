routesConfig = ($routeProvider) ->
  $routeProvider
    .when '/',
      templateUrl: 'views/homepage.html'
      controller: 'Homepage'
      controllerAs: 'Homepage'

routesConfig.$inject = ['$routeProvider']

angular
  .module('socialapp')
  .config(routesConfig)
