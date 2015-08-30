$(document).on("ready page:load", function(){

  $(".js-filter-form").on("ajax:success", function(e, data, status, xhr){
    $(".js-filtered-table").html(data)
  });

  $("#query").on("keyup", function(e){
    $(".js-filter-form").submit()
  });
});
