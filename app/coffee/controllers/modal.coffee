angular
   .module("angularTodoList")
   .controller("ModalCtrl", ($scope, $modalInstance) ->

      $scope.close = ->
         $modalInstance.dismiss("close")

      $scope.submit = (newTodo) ->
         $modalInstance.close(newTodo)

   )