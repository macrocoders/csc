$ ->
  $('.table-responsive').on 'show.bs.dropdown', ->
    $('.table-responsive').css 'overflow', 'inherit'
    return
  
  $('.table-responsive').on 'hide.bs.dropdown', ->
    $('.table-responsive').css 'overflow', 'auto'
    return    
