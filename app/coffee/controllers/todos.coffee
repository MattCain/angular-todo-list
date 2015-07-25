angular
   .module("angularTodoList")
   .controller("TodosCtrl", ($scope, $modal) ->
      $scope.openCreationModal = ->
         $modal.open(
            templateUrl: "/templates/modal.html"
         )
   )