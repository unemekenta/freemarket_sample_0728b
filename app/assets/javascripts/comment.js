$(document).on('turbolinks:load', function () {
  function buildHTML(message) {
    var comment = message.comment ? `${message.comment}` : "";
    var nickname = message.nickname ? `${message.nickname}` : "";
    var id = message.id ? `${message.id}` : "";
    var html = `<li class="product_messages__items__item" data-id="${id}">
                  <a class="product_messages__items__item__messege-user" href="/users/2/introduction">
                    <figure class="product_messages__items__item__messege-user__figure">
                      <div class="product_messages__items__item__messege-user__figure__div">
                        <img src="https://cdn.pixabay.com/photo/2016/05/17/22/16/baby-1399332_1280.jpg">
                      </div>
                      <figcaption class="product_messages__items__item__messege-user__figure__figcaption">
                        ${nickname}
                      </figcaption>
                    </figure>
                  </a>
                  <div class="message-body">
                    <div class="message-body__text">
                      <p>${comment}</p>
                    </div>
                    <div class="message-body__icons">
                      <time class="message-icon-left">
                        <i class="fa fa-clock-o"></i>
                        <span>1時間前</span>
                      </time>
                      <div class="message-icon-right">
                        <a class="test" href="/">編集</a>
                        <a rel="nofollow" data-method="delete" href="/products/4/comments/26">削除</a>
                        <i class="fa fa-flag-o"></i>
                      </div>
                    </div>
                    <i class="icon-balloon"></i>
                  </div>
                </li>`
    return html;
  }

  function scrollBottom() {
    var position = $('.product_messages__items')[0].scrollHeight;
    var speed = 1000;
    $('.product_messages__items').animate({
      scrollTop: position
    }, speed, 'swing');
  }

  function reloadMessages() {
    if (location.pathname.match(/\/products\/\d+/)) {
      var last_message_id = $('.product_messages__items__item:last').data('id');
      $.ajax({
          url: '/api/products/4',
          type: 'GET',
          data: {
            product_id: 4,
            comment_id: last_message_id
          },
          dataType: 'json',
        })
        .done(function (messages) {
          messages.forEach(function (message) {
            var insertHTML = buildHTML(message);
            $('.product_messages__items').append(insertHTML);
            scrollBottom();
          });
        })
        .fail(function () {
          alert("自動更新に失敗しました");
        })
    }
  }

  $('form').on('submit', function (e) {
    e.preventDefault();
    var message = new FormData(this);
    var url = $(this).attr('action');

    $.ajax({
        type: 'POST',
        url: url,
        data: message,
        dataType: 'json',
        processData: false,
        contentType: false
      })
      .done(function (message) {
        var html = buildHTML(message);
        $('.product_messages__items').append(html);
        $('.product__message__form').val('');
        scrollBottom();
      })
      .fail(function () {
        alert('error');
      })
      .always(function () {
        setTimeout(function () {
          $('.product__message__submit-btn').removeAttr('disabled');
        });
      })
  });

  setInterval(reloadMessages, 5000);
});