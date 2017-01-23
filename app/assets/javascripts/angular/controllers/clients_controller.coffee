@csc.controller 'clientsController', [ '$scope', '$filter', 'clientService', ($scope,$filter,clientService)->
    $scope.isLoading = false
    $scope.clients = []
    lastStart = 0
    itemByPage = 20
    
    $scope.init = (clientsTotalNumber) ->
      $scope.clientsTotalNumber = clientsTotalNumber 
      
    $scope.callServer = (tableState) ->
      $scope.isLoading = true
      tableState.pagination.totalItemCount = $scope.clientsTotalNumber
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
