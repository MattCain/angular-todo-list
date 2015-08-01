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
         if not newTodo.fave then newTodo.fave = false
         newTodo.id = Date.now()
         Todos.push(newTodo)
         @saveTodos()
         

      @removeTodo = $scope.removeTodo = (id) =>
         index = _.findIndex(Todos, (todo) -> id is todo.id)
         Todos.splice(index, 1)
         @saveTodos()

      @faveTodo = $scope.faveTodo = (id) =>
         toFave = _.find(Todos, (todo) -> todo.id is id)
         toFave.fave = !toFave.fave
         @saveTodos()

      # save the todos in sessionStorage as a JSON string.
      # the todos aren't important so sessionStorage is fine as it'll clear them when the page closes.
      @saveTodos = ->
         sessionStorage.setItem("todos", JSON.stringify(Todos))

   )