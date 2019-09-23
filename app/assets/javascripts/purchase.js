$(function(){
  $('#purchase_btn').click(function(){
    $('#done_overlay').fadeIn();
  });
  $('#done_overlay_ok').click(function(){
    $('#done_overlay').hide();
  });

});