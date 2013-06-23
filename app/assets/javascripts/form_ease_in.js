$(document).ready(function(){
  $('.pop_down').css('display', 'none');

  $('#user_role_requester').click(function(){
    $('.pop_down').fadeIn(800);
  });

  $('#user_role_shoveler').click(function(){
    $('.pop_down').css('display', 'none');
  });
});
