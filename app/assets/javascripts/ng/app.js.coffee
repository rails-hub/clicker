angular.module("Clicker.controllers", [])
angular.module("Clicker.services", ['ngCookies'])
angular.module("Clicker.factories", ['rails'])
angular.module("Clicker.providers", [])
angular.module("Clicker.widgets", [])
angular.module("Clicker.directives", [])
angular.module("Clicker.interceptors", [])
angular.module("Clicker.filters", [])

app = angular.module("Clicker",[
                                    "ui.bootstrap.modal",
                                    "ui.bootstrap.pagination",
                                    "ui.bootstrap.popover",
                                    'ui.bootstrap.tpls',
                                    "Clicker.controllers",
                                    "Clicker.services",
                                    "Clicker.widgets",
                                    'Clicker.factories',
                                    'ngAnimate',
                                    'Clicker.directives',
                                    'templates'])


app.config ($httpProvider, railsSerializerProvider, RailsResourceProvider) ->
  RailsResourceProvider.underscoreParams(true)
  railsSerializerProvider.underscore(angular.identity).camelize(angular.identity)

  token = $('meta[name=csrf-token]').attr('content')
  $httpProvider.defaults.headers.delete ||= {}
  $httpProvider.defaults.headers.post['X-CSRF-Token'] = token
  $httpProvider.defaults.headers.put['X-CSRF-Token'] = token
  $httpProvider.defaults.headers.delete['X-CSRF-Token'] = token






