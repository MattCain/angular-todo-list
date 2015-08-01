angular
   .module("angularTodoList", ["ui.router", "ui.bootstrap", "ngAnimate"])
   .config(['$stateProvider', '$urlMatcherFactoryProvider',
      ($stateProvider, $urlMatcherFactoryProvider) ->

         # Allow trailing slashes
         $urlMatcherFactoryProvider.strictMode(false)

         $stateProvider
            .state("index",
               url: ""
               templateUrl: "templates/index.html"
               controller: "TodosCtrl"
            )
   ])
   .value("Todos", do ->
      # check for saved todos
      todos = sessionStorage.getItem("todos")
      if todos then JSON.parse(todos) else []
   )