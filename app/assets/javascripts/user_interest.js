$(document).on('page:load', function() {

  $(".surf_checkbox").click(function(){
    $("#show_surf_breaks").toggle();
  });

  $(".concert_checkbox").click(function(){
    $("#songkick_box").toggle();
  });

  $("div#region_1").click(function(){
    $("div#location_1").toggle();
  });
  
  $("div#region_2").click(function(){
    $("div#location_2").toggle();
  }); 

});

