that = this 
@csc.factory 'modelService', [
  '$http'
  ($http) ->
    
    getModels = (page, search_obj) ->
      if search_obj == undefined
        search = ''
      else
        search = search_obj.title
      return $http.get(that.urls['models_path'], params: {page: page+1, search: search})
    
    service = 
      models: []
      getModels: getModels

    service
]
