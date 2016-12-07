$ ->
  $('.infinite-table').infinitePages
    #debug: true
    #buffer: 200
    context: '.live-box'
    loading: ->
      $(this).text('Loading...')
    error: ->
      $(this).text('Here was an error, please try again')

  $('.table-responsive').on 'show.bs.dropdown', ->
    $('.table-responsive').css 'overflow', 'inherit'
    return
  
  $('.table-responsive').on 'hide.bs.dropdown', ->
    $('.table-responsive').css 'overflow', 'auto'
    return    
