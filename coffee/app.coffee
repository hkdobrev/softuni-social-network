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

app.config [
  '$httpProvider'
  ($httpProvider) ->
    $httpProvider.defaults.cache = true
]

app.run [
  '$rootScope'
  '$location'
  'Auth'
  ($rootScope, $location, Auth) ->
    $rootScope.$on '$routeChangeStart', (event) ->
      if not Auth.isLoggedIn() and $location.path() isnt '/login'
        event.preventDefault()
        $location.path '/login'
]

app.run [
  'Auth'
  '$http'
  (Auth, $http) ->
    if Auth.getAccessToken()
      $http.defaults.headers.common
          .Authorization = 'Bearer ' + Auth.getAccessToken()

    return
]
