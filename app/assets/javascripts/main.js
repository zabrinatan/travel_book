console.log('Hello World')

$(document).ready(function () {
  $('.dash_link').on('click', function(event){
    event.preventDefault();
    $(this).closest('.location').find('.frame').slideToggle(1000);
  })

  $('#minus').on('click', function(event){

    $('.delete_form').slideToggle(200);
  })

  $('#plus').on('click', function(event){

    $('.add_dash').slideToggle(200);
  })



});
