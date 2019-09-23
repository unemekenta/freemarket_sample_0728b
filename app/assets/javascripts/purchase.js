document.addEventListener('turbolinks:load', function(){
  $(function(){
    $('#purchase_btn').click(function(){
      setTimeout(function(){
        $('#done_overlay').fadeIn();
        $(this).css('background-color', '#ccc').css('border', 'none').css('cursor', 'not-allowed');
        $('#purchase_btn').css('background-color', '$main_gray');
      },1000);
    });
    $('#done_overlay_ok').click(function(){
      $('#done_overlay').hide();
    });
    locateCenter();
    $(window).resize(locateCenter);

    function locateCenter() {
      let w = $(window).width();
      let h = $(window).height();

      let dw = $('#done_overlay').outerWidth();
      let dh = $('#done_overlay').outerHeight();

      $('#done_overlay').css({
        'left': ((w - dw) / 2) + 'px'
      });
    }
  });
});