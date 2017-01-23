@csc.controller 'modelsController', [ '$scope', '$filter', 'modelService', ($scope,$filter,modelService)->
    $scope.isLoading = false
    $scope.models = []
    lastStart = 0
    itemByPage = 20
    
    $scope.init = (modelsTotalNumber) ->
      $scope.modelsTotalNumber = modelsTotalNumber 
      
    $scope.callServer = (tableState) ->
      console.log($scope.modelsTotalNumber)
      $scope.isLoading = true
      tableState.pagination.totalItemCount = $scope.modelsTotalNumber
      modelService.getModels(tableState.pagination.start / itemByPage, tableState.search.predicateObject).then (result) ->
        if tableState.pagination.start == 0
          $scope.displayedModels = result.data
        else
          $scope.displayedModels = $scope.displayedModels.concat(result.data)
        lastStart = tableState.pagination.start
        $scope.isLoading = false
    
]
