routesConfig = ($routeProvider) ->
  $routeProvider
    .when '/',
      templateUrl: 'views/index.html'
      controller: 'Homepage as home'

routesConfig.$inject = ['$routeProvider']

angular
  .module('socialapp')
  .config(routesConfig)
