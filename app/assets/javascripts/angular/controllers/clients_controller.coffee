@csc.controller 'clientsController', [ '$scope', '$filter', 'clientService', ($scope,$filter,clientService)->
    $scope.isLoading = false
    $scope.clients = []
    lastStart = 0
    maxNodes = 40
    itemByPage = 20
    
      
    $scope.callServer = (tableState) ->
      console.log(tableState)
      $scope.isLoading = true
      tableState.pagination.totalItemCount = 68
      clientService.getClients(tableState.pagination.start / itemByPage, tableState.search.predicateObject).then (result) ->
        if tableState.pagination.start == 0
          $scope.displayedClients = result.data
        else
          $scope.displayedClients = $scope.displayedClients.concat(result.data)
          #if lastStart < tableState.pagination.start and $scope.displayedClients.length > maxNodes
          #  $scope.displayedClients.splice 0, 20
        lastStart = tableState.pagination.start
        $scope.isLoading = false
    
]
