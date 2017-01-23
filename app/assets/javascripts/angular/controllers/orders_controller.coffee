@csc.controller 'ordersController', [ '$scope', '$filter', 'orderService', ($scope,$filter,orderService)->
    $scope.isLoading = false
    $scope.orders = []
    lastStart = 0
    itemByPage = 20
    
    $scope.init = (ordersTotalNumber) ->
      $scope.ordersTotalNumber = ordersTotalNumber 
      
    $scope.callServer = (tableState) ->
      $scope.isLoading = true
      tableState.pagination.totalItemCount = $scope.ordersTotalNumber
      orderService.getOrders(tableState.pagination.start / itemByPage, tableState.search.predicateObject).then (result) ->
        if tableState.pagination.start == 0
          $scope.displayedOrders = result.data
        else
          $scope.displayedOrders = $scope.displayedOrders.concat(result.data)
        lastStart = tableState.pagination.start
        $scope.isLoading = false
    
]
