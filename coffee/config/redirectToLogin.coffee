redirectToLoginConfiguration = ($rootScope, $location, Auth) ->
  $rootScope.$on '$routeChangeStart', (event) ->
    if not Auth.isLoggedIn() and $location.path() isnt '/login'
      event.preventDefault()
      $location.path '/login'

redirectToLoginConfiguration.$inject = ['$rootScope', '$location', 'Auth']

angular
  .module('socialapp')
  .run(redirectToLoginConfiguration)
