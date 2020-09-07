//= require_tree .

$(document).ready(function() {
  
  var heroHeight = $(".uxr-hero").outerHeight();

  $(window).scroll(function() {
    var height = $(window).scrollTop();
    if(height > heroHeight) {
      $('.moon').addClass('active');
    } else {
      $('.moon').removeClass('active');
    }
  });


});