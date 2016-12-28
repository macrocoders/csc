that = this 
@csc.factory 'clientService', [
  '$http'
  ($http) ->
    
    getClients = (page, search_obj) ->
      if search_obj == undefined
        search = ''
      else
        search = search_obj.name
      return $http.get(that.urls['clients_path'], params: {page: page, search: search})
    
    service = 
      clients: []
      getClients: getClients

    service
]
