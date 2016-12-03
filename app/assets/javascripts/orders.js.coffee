$ ->
  $('.infinite-table').infinitePages
    #debug: true
    #buffer: 200
    context: '.live-box'
    loading: ->
      $(this).text('Loading...')
    error: ->
      $(this).text('Here was an error, please try again')
