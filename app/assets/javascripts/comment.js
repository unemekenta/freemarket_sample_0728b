$(document).on('turbolinks:load', function () {
  function buildHTML(message) {
    var comment = message.comment ? `${message.comment}` : "";
    var nickname = message.nickname ? `${message.nickname}` : "";
    var user_id = message.user_id ? `${message.user_id}` : "";
    var photo = (message.photo_exist === "0") ? '/images/mercari_user.png' : `${message.photo}`;
    var product_id = message.product_id ? `${message.product_id}` : "";
    var id = message.id ? `${message.id}` : "";
    var html = `<li class="product_messages__items__item" data-id="${id}">
                  <a class="product_messages__items__item__messege-user" href="/users/${user_id}/introduction">
                    <figure class="product_messages__items__item__messege-user__figure">
                      <div class="product_messages__items__item__messege-user__figure__div">
                        <img src="${photo}">
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
                        <a rel="nofollow" data-method="delete" href="/products/${product_id}/comments/${id}">削除</a>
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
      var product_id = location.pathname.split('/')[2];
      var url = `/api/products/${product_id}`
      var last_message_id = $('.product_messages__items__item:last').data('id');
      $.ajax({
          url: url,
          type: 'GET',
          data: {
            product_id: product_id,
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

  $('.new_comment').on('submit', function (e) {
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
        console.log(html);
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