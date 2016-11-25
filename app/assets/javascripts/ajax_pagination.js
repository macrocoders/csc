$(function() {
  var loadingHTML = "<div class='loading'></div>";
  
  $(document.body).off('click', 'ul.pagination li a');
  $(document.body).on('click', 'ul.pagination li a', function(e) {
    e.preventDefault();
    $("#listContainer").html(loadingHTML).load($(this).attr("href"))//.hide().fadeIn('slow');
    return false;
  });
  
  $(document.body).on('keyup', '#searchForm input', function () {
    $("#listContainer").html(loadingHTML);
    setTimeout(function(){
      $.get($('#searchForm').attr('action'), $('#searchForm').serialize() )
        .done(function( data ) {
          $("#listContainer").html(data);
        });
      return false;    
    },2000);
  });
  
  $("#modalDialog").on("show.bs.modal", function(e) {
    var link = $(e.relatedTarget);
    $('.search-form #search').val('');
    $(this).find(".modal-body").load(link.attr("href"));
  });
});
