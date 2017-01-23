$ ->
  $('input').iCheck
    checkboxClass: 'icheckbox_square-blue'
    radioClass: 'iradio_square-blue'
    increaseArea: '20%'
      
  $('#client_phone').mask "+7(000)000-00-00", placeholder: "+7(___)___-__-__" 

  $('#modalDialog').on 'hidden.bs.modal', ->
    $(this).removeData 'bs.modal'
    return
  
  setTimeout (->
    $('.alert-box').hide()
    return
  ), 5000 
