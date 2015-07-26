angular
   .module("angularTodoList")
   .controller("TodosCtrl", ($scope, $modal, Todos) ->

      $scope.todos = Todos

      $scope.openModal = =>
         modalInstance = $modal.open(
            templateUrl: "/templates/modal.html"
            controller: "ModalCtrl"
         )

         modalInstance.result.then((newTodo) =>
            @createTodo(newTodo)
         )

      @createTodo = (newTodo) ->
         Todos.push(newTodo)
         @saveTodos()
         

      @removeTodo = $scope.removeTodo = (index) =>
         Todos.splice(index, 1)
         @saveTodos()

      @saveTodos = ->
         sessionStorage.setItem("todos", JSON.stringify(Todos))

   )