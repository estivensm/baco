$(document).on("ready page:load", function(){

  $(".js_intereses").on("ajax:success", function(e, data, status, xhr){
    alert("Se registraron los intereses");
    $(".js-filtered-table").html(data)
  });

  $(".js_intereses").on("ajax:error", function(e, xhr, status, error){
    alert(error);
  });
});
