angular
   .module("angularTodoList", ["ui.router", "ui.bootstrap"])
   .config(['$stateProvider', '$urlMatcherFactoryProvider',
      ($stateProvider, $urlMatcherFactoryProvider) ->

         $urlMatcherFactoryProvider.strictMode(false)

         $stateProvider
            .state("index",
               url: ""
               templateUrl: "templates/index.html"
            )
            .state("page2",
               url: "page2"
               templateUrl: "templates/page2.html"
            )
   ])