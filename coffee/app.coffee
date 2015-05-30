app = angular.module 'socialapp', [
  'ngRoute'
  'ngResource'
]

app.value 'BASE', 'http://softuni-social-network.azurewebsites.net/api'

app.config [
  '$locationProvider'
  ($locationProvider) ->
    $locationProvider.html5Mode true
]

app.run [
  '$rootScope'
  '$location'
  'Auth'
  ($rootScope, $location, Auth) ->
    $rootScope.$on '$routeChangeStart', (event) ->
      if not Auth.isLoggedIn() and $location.path() isnt '/'
        event.preventDefault()
        $location.path '/'
]
