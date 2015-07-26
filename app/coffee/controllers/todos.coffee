angular
   .module("angularTodoList")
   .controller("TodosCtrl", ($scope, $modal, Todos) ->

      $scope.todos = Todos

      $scope.openModal = ->
         modalInstance = $modal.open(
            templateUrl: "/templates/modal.html"
            controller: "ModalCtrl"
         )

         modalInstance.result.then((newTodo) ->
            $scope.todos.push(newTodo)
         )
   )