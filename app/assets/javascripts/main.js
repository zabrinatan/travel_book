console.log('Hello World')

$(document).ready(function () {
  $('.dash_link').on('click', function(event){
    event.preventDefault();
    $(this).closest('.location').find('.frame').slideToggle(1000);
  })



});
