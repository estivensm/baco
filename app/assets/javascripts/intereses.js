$(document).on("ready page:load", function(){

  $(".js_intereses").on("ajax:success", function(e, data, status, xhr){
    alert(data.msg);
    alert(xhr.responseText);
  });

  $(".js_intereses").on("ajax:error", function(e, xhr, status, error){
    alert(error);
  });
});
