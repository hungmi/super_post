// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require semantic-ui
//= require turbolinks
//= require_tree .

  $(document).ready(function(){
    $('.ui.embed').embed();
    $('select.dropdown')
      .dropdown()
    ;
    $('.ui.accordion')
      .accordion({
        onOpening:function(){
          $(".owl-carousel").owlCarousel({
            //autoPlay: 3000, //Set AutoPlay to 3 seconds
            items : 3,
            // itemsDesktop : [1199,3],
            // itemsDesktopSmall : [979,3]
            lazyLoad : true,
            navigation : true
          });
        }
    })
  })