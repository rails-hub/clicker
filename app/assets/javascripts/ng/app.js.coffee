angular.module("Telcoedge.controllers", [])
angular.module("Telcoedge.services", ['ngCookies'])
angular.module("Telcoedge.factories", ['rails'])
angular.module("Telcoedge.providers", [])
angular.module("Telcoedge.widgets", [])
angular.module("Telcoedge.directives", [])
angular.module("Telcoedge.interceptors", [])
angular.module("Telcoedge.filters", [])

app = angular.module("Telcoedge",[
                                    "ui.bootstrap.modal",
                                    "ui.bootstrap.pagination",
                                    "ui.bootstrap.popover",
                                    'ui.bootstrap.tpls',
                                    "Telcoedge.controllers",
                                    "Telcoedge.services",
                                    "Telcoedge.widgets",
                                    'Telcoedge.factories',
                                    'ngAnimate',
                                    'Telcoedge.directives',
                                    'templates'])


app.config ($httpProvider, railsSerializerProvider, RailsResourceProvider) ->
  RailsResourceProvider.underscoreParams(true)
  railsSerializerProvider.underscore(angular.identity).camelize(angular.identity)

  token = $('meta[name=csrf-token]').attr('content')
  $httpProvider.defaults.headers.delete ||= {}
  $httpProvider.defaults.headers.post['X-CSRF-Token'] = token
  $httpProvider.defaults.headers.put['X-CSRF-Token'] = token
  $httpProvider.defaults.headers.delete['X-CSRF-Token'] = token






