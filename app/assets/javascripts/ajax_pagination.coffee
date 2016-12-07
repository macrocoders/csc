$ ->
  loadingHTML = '<div class=\'loading\'></div>'
  
  $(document.body).off 'click', '#modalDialog ul.pagination li a'
  $(document.body).on 'click', '#modalDialog ul.pagination li a', (e) ->
    e.preventDefault()
    $('#listContainer').html(loadingHTML).load $(this).attr('href')
    false
    
  $(document.body).on 'keyup', '#searchForm input', ->
    $('#listContainer').html loadingHTML
    setTimeout (->
      $.get($('#searchForm').attr('action'), $('#searchForm').serialize()).done (data) ->
        $('#listContainer').html data
        return
      false
    ), 2000
    return
    
  $('#modalDialog').on 'show.bs.modal', (e) ->
    link = $(e.relatedTarget)
    $('.search-form #search').val ''
    $(this).find('.modal-title').html link.data('title')
    if link.data('search-action') == undefined
      $(this).find('#searchForm').hide()
    else
      $(this).find('#searchForm').attr 'action', link.data('search-action')
    if link.data('new-link') == undefined 
      $(this).find('#newLink').hide()
    else 
      $(this).find('#newLink').attr 'href', link.data('new-link')
    $(this).find('.modal-body').load link.attr('href')
    return
  return
