that = this 
@csc.factory 'orderService', [
  '$http'
  ($http) ->
    
    getOrders = (page, search_obj) ->
      if search_obj == undefined
        search = ''
      else
        search = search_obj.search
      return $http.get(that.urls['orders_path'], params: {page: page+1, search: search})
    
    service = 
      orders: []
      getOrders: getOrders

    service
]
