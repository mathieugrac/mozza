//= require_tree .

$(document).ready(function() {
  
  console.log("js loaded");

  ScrollReveal().reveal('.reveal',{ reset: true });

  AOS.init({
      offset: 150
    });
  
  $('.grid').colcade({
  	columns: '.grid-col',
  	items: '.grid-item'
	})

  $('.navbar-toggle').on('click', function(e){
    $('body').toggleClass('navbar-is-open');
  });

  // set interval
  var tid = setInterval(mycode, 5000);

  function mycode() {
    // do some stuff...
    $('.before-after').toggleClass('reveal');
    // no need to recall the function (it's an interval, it'll loop forever)
  }

  function abortTimer() { // to be called when you want to stop the timer
    clearInterval(tid);
  }

  $('.before-after').on('click', function(e){
    e.preventDefault();
    $(this).toggleClass('reveal');
  });
  $('.before-after').on('onMouseDown', function(e){
    e.preventDefault();
  });

  $(window).resize(function(){
    var viewportWidth = $(window).width();
    if(viewportWidth >= 768) {
      $('body').removeClass('navbar-is-open'); 
    }
  });

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