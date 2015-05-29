(function() {
  var routesConfig;

  routesConfig = function($routeProvider) {
    return $routeProvider.when('/', {
      templateUrl: 'views/index.html',
      controller: 'Homepage as home'
    });
  };

  routesConfig.$inject = ['$routeProvider'];

  angular.module('socialapp').config(routesConfig);

}).call(this);
