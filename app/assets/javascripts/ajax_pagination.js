$(function() {
  $(document.body).off('click', 'ul.pagination li a');
  $(document.body).on('click', 'ul.pagination li a', function(e) {
    e.preventDefault();
    var loadingHTML = "<div class='loading'>Loading...</div>";
    $("#listContainer").html(loadingHTML).load($(this).attr("href"))//.hide().fadeIn('slow');
    return false;
  });
  $(document.body).on('keyup', '#searchForm input', function () {
    setTimeout(function(){
      $.get($('#searchForm').attr('action'), $('#searchForm').serialize() )
        .done(function( data ) {
          $("#listContainer").html(data);
        });
      return false;    
    },1000);
  });
});
