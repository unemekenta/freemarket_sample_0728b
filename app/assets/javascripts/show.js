$(document).on('turbolinks:load', function () {
  $('img[id^=showimage]').hover(function () {
    $('.product__main-contents__photo-main').children('img').attr('src', $(this).attr('src'));
    $(this).css('opacity', '1');
  }, function () {
    $(this).css('opacity', '0.6');
  });
});