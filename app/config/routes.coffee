userResolver = ($route, User) ->
  User.get
    username: $route.current.params.username

userResolver.$inejct = ['$route', 'User']

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

    .when '/users/:username',
      templateUrl: 'views/user.html'
      controller: 'UserCtrl'
      controllerAs: 'UserCtrl'
      resolve:
        user: userResolver

    .otherwise
      redirectTo: '/'

routesConfig.$inject = ['$routeProvider']

angular
  .module('socialapp')
  .config(routesConfig)
