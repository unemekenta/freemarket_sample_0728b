document.addEventListener('turbolinks:load', function(){
  $(function(){
    $('.purchase_btn_for_popup').click(function(){
      setTimeout(function(){
        $('#done_overlay').fadeIn();
        $('.purchase_btn_for_popup').css('background-color', '#ccc').css('border', 'none').css('cursor', 'not-allowed').css('background-color', '$main_gray');
        $('.single-container__header,.purchase-container__product,.purchase-container__deliver,.purchase-container__payment__inner').css('pointer-events', 'none');
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