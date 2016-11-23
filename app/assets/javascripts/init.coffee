$ ->
  $('input').iCheck
    checkboxClass: 'icheckbox_square-blue'
    radioClass: 'iradio_square-blue'
    increaseArea: '20%'
    
  $('#datatable').DataTable
    responsive: true
    processing: true
    serverSide: true
    ajax: $('#datatable').data('source')
    pagingType: 'full_numbers'
