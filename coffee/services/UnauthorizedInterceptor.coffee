UnauthorizedInterceptor = (
  $rootScope,
  $q,
  $injector,
  $location,
  $window
) ->
  responseError: (rejection) ->
    if rejection.status == 401 and
    rejection.data.message == 'Session token expired or not valid.'
      $window.localStorage.removeItem 'accessToken'
      $window.localStorage.removeItem 'username'
      $location.path '/login'

    $q.reject rejection


UnauthorizedInterceptor.$inject = [
  '$rootScope'
  '$q'
  '$injector'
  '$location'
  '$window'
]

angular
  .module('socialapp')
  .factory('UnauthorizedInterceptor', UnauthorizedInterceptor)
