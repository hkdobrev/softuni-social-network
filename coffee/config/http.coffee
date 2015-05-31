httpConfiguration = ($httpProvider) ->
  $httpProvider.defaults.cache = true
  $httpProvider.interceptors.push 'UnauthorizedInterceptor'

httpConfiguration.$inject = ['$httpProvider']

angular
  .module('socialapp')
  .config(httpConfiguration)
