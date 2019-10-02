$(document).on('turbolinks:load', function () {

  //--------------------------------------------------------------------
  //画像投稿機能
  var url = location.href.split('/')[5];
  var array = [];
  var count = $('.sell-upload-drop-box').length;
  for (var i = 0; i < `${count}`; i++) {
    array.push(i)
  }
  var default_array_length = array.length;
  //--------------------------------------------------------------------
  //アップロードエリア初期化
  function Resetdropbox() {
    $('.sell-upload-drop-box').eq(0).attr({
      for: `product_product_images_attributes_0_image`,
      class: `sell-upload-drop-box have-item-0`
    });
    $('.sell-upload-drop-box').eq(0).children('input').attr({
      name: `product[product_images_attributes][${array[0]}][image]`,
      id: `product_product_images_attributes_${array[0]}_image`
    });
  }
  //--------------------------------------------------------------------
  //アップロードエリアのRenumbering function
  function Renumbering() {
    count = $('.sell-upload-drop-box').length;

    if (count === 1) {
      Resetdropbox();
    }
    //Renumbering 番号を採番しなおし、最後のアップロードエリア以外は非表示に変更する
    for (var i = 0; i < `${count}`; i++) {
      Resetdropbox();
      $('.sell-upload-drop-box').eq(`${i + 1}`).attr({
        for: `product_product_images_attributes_${i + 1}_image`,
        class: `sell-upload-drop-box have-item-${i + 1}`
      });
      $('.sell-upload-drop-box').eq(`${i + 1}`).children('input').attr({
        name: `product[product_images_attributes][${array[i + 1]}][image]`,
        id: `product_product_images_attributes_${array[i + 1]}_image`
      });
      $('.sell-upload-drop-box').eq(`${i}`).css('display', 'none');

      $('.sell-upload-delete').eq(`${i}`).attr({
        value: `${i}`
      });
    }
    //総数が9枚以下ならアップロードエリアを表示する
    if (count <= 10) {
      $('.sell-upload-drop-box:last-child').css('display', 'block');
    }

    //総数が10枚ならアップロードエリアを表示しない
    if (count > 10) {
      $('.sell-upload-drop-box:last-child').css('display', 'none');
    }
  }
  //--------------------------------------------------------------------
  //イベントバブリング防止
  $fileField = $('.sell-upload-drop-file')
  $($fileField).click(function (e) {
    e.stopPropagation();
  });
  //親要素アップロードエリアを洗濯した際に子要素inputを発火させる処理
  $('.sell-upload-drop-box').on('click', function () {
    $(this).children('input').click();
  });
  //--------------------------------------------------------------------
  $($fileField).on('change', function (e) {
    //画像プレビュー機能
    file = e.target.files[0];
    reader = new FileReader();
    $preview = $('.sell-upload-items').children('ul')

    reader.onload = function (e) {
      $preview.append($('<li>').attr({
        class: "sell-upload-item"
      }).append($('<figure>').attr({
        class: "sell-upload-figure portrait"
      }).append($('<img>').attr({
        src: e.target.result,
        width: "100%"
      }))).append($('<div>').attr({
        class: "sell-upload-button"
      }).append($('<a href>編集</a>').attr({
        class: "sell-upload-edit"
      })).append($('<a href>削除</a>').attr({
        class: "sell-upload-delete",
        id: `${array[array_length] + 1}`,
        value: `${$('.sell-upload-item').length}`,
      }))));
    };
    reader.readAsDataURL(file);
  //--------------------------------------------------------------------
    //画像複数投稿機能
    var clone = $(this).parent().clone(true);
    $(this).parent().parent().append(clone);
    var array_length = array.length - 1;
    if (url === "edit") {
      array.push(default_array_length);
      default_array_length++;
    } else {
      array.push(array[array_length] + 1);
    }
    Renumbering();
  });
  //--------------------------------------------------------------------
  //画像編集機能(未実装)(今の所実装予定なし)
  $('.sell-upload-items').on('click', '.sell-upload-edit', function () {
    return false;
  });
  //--------------------------------------------------------------------
  //画像削除機能
  $('.sell-upload-items').on('click', '.sell-upload-delete', function () {
    var num = $(this).attr('id');
    var length = $(this).attr('value');
    array.splice(length, 1);
    if (url === "edit") {
      $('.sell-dropbox-container').children('input[type="checkbox"]').eq(`${num}`).prop('checked', true);
    }
    $('.sell-upload-drop-box').eq(`${length}`).remove();
    $(this).parent().parent().remove();
    Renumbering();
    return false;
  });

  //--------------------------------------------------------------------
  //Edit時画像投稿機能

  var url = location.href.split('/')[5];

  if (url === "edit") {
    var clone = $('.sell-upload-drop-box:last').clone(true);
    $('.sell-upload-drop-box').children('input').remove();
    //いつか時間があれば実装(DOMの見た目を綺麗にするだけ)
    //count = $('.sell-upload-drop-box').length;
    //for (var i = 0; i < `${count}`; i++) {
    //  var inputclone = $('.sell-dropbox-container').children('input').eq(`${i}`).clone(true);
    //  $('.sell-dropbox-container').children('.sell-upload-drop-box').eq(`${i}`).append(inputclone)
    //}
    //$('.sell-dropbox-container').children('input').remove();
    $('.sell-upload-drop-box').parent().append(clone);
    Renumbering();
  }
  //--------------------------------------------------------------------
  //DOMリセット用function
  function resetHTML(num) {
    if (num === 1) {
      $('.brand').val("");
      $('.division2').val("");
      $('.division2-container').children('select').removeAttr("value");
      $('.division2-container').css('display', 'none');
      $('.division3-container').css('display', 'none');
    } else if (num === 2) {
      $('.division3').val("");
      $('.division3-container').children('select').removeAttr("value");
      $('.division3-container').css('display', 'none');
    } else {
      $('.size').val("");
      $('.size').children().children('select').removeAttr("value");
      $('.size-container').css('display', 'none');
    }
  }
  //--------------------------------------------------------------------
  //サイズタイプ初期設定
  //引っ張ってくるidは暫定で手打ち
  //今後はcontroller, view, JSの順で取得したい。(自動化)
  function insertIds(array, first, last) {
    for (var i = first; i <= last; i++) {
      array.push(i);
    }
  }

  var adultWearSize = new Array();
  insertIds(adultWearSize, 159, 218);
  insertIds(adultWearSize, 229, 230);
  insertIds(adultWearSize, 315, 317);
  insertIds(adultWearSize, 338, 381);
  insertIds(adultWearSize, 402, 405);
  insertIds(adultWearSize, 457, 458);
  insertIds(adultWearSize, 1085, 1086);
  insertIds(adultWearSize, 1096, 1097);

  var childWearSize = new Array();
  insertIds(childWearSize, 495, 534);
  insertIds(childWearSize, 495, 534);
  insertIds(childWearSize, 1087, 1087);
  insertIds(childWearSize, 1098, 1098);

  var babyWearSize = new Array();
  insertIds(babyWearSize, 468, 494);

  var ladiesShoesSize = new Array();
  insertIds(ladiesShoesSize, 219, 228);
  insertIds(ladiesShoesSize, 1083, 1083);
  insertIds(ladiesShoesSize, 1093, 1093);

  var mensShoesSize = new Array();
  insertIds(mensShoesSize, 382, 389);
  insertIds(mensShoesSize, 1082, 1082);
  insertIds(mensShoesSize, 1092, 1092);

  var childShoesSize = new Array();
  insertIds(childShoesSize, 535, 539);
  insertIds(childShoesSize, 1084, 1084);
  insertIds(childShoesSize, 1094, 1094);

  var snowboardBoardSize = new Array();
  insertIds(snowboardBoardSize, 1080, 1080);

  var skiBoardSize = new Array();
  insertIds(skiBoardSize, 1091, 1091);

  var tireSize = new Array();
  insertIds(tireSize, 1217, 1220);

  var motorcycleSize = new Array();
  insertIds(motorcycleSize, 147, 147);

  var motorcycleHelmetSize = new Array();
  insertIds(motorcycleHelmetSize, 1263, 1263);

  var tvSize = new Array();
  insertIds(tvSize, 982, 982);
  //--------------------------------------------------------------------
  //価格表示function
  function setPrice(price) {
    var fee = Math.round(price * 0.1).toLocaleString();
    $('.fee').text(`¥${fee}`);
    var profit = Math.round(price - price * 0.1).toLocaleString();
    $('.profit').text(`¥${profit}`);
  }
  //--------------------------------------------------------------------
  //edit用の機能(edit時は登録データがあれば初期表示)
  //カテゴリ1
  var div1Selected = $('.division1').attr('value');
  $('.division1').find('[value = ' + div1Selected + ']').attr('selected', 'selected');
  //カテゴリ2
  $('.division2[value]').parent().css('display', 'block');
  var div2Selected = $('.division3[value]').attr('value');
  $('.division2[value]').find('[value = ' + div2Selected + ']').attr('selected', 'selected');
  $('.division2[value]').attr("value", "changed");
  //カテゴリ3
  $('.division3[value]').parent().css('display', 'block');
  $('.division3[value]').attr("value", "changed");
  //サイズ
  $('.size[value]').parent().parent().css('display', 'block');
  $('.size[value]').attr("value", "changed");
  //価格
  var editprice = $('.price').val();
  setPrice(editprice);

  var editPath = location.href.split('/')[5];
  if (editPath === "edit") {
    //ブランド(edit時はデフォルト表示)
    $('.brand-container').css('display', 'block');
  }
  //--------------------------------------------------------------------
  //カテゴリ表示機能 兼 ブランド表示機能
  $('.division1').on('change', function () {
    resetHTML(1);
    $('.size-container').css('display', 'none');
    var selected = Number($(this).val());
    if (selected === 0) {
      $('.division2-container').css('display', 'none');
      $('.division3-container').css('display', 'none');
    } else {
      var middlecategory = $('.division2-container').eq(selected - 1);
      middlecategory.css('display', 'block');
      middlecategory.children('select').attr("value", "changed");
      $('.brand-container').css('display', 'block');
    }
  });

  $('.division2').on('change', function () {
    resetHTML(2);
    $('.size-container').css('display', 'none');
    var selected = Number($(this).val());
    if (selected === 0 || selected === 147 || selected === 158) {
      $('.division3-container').css('display', 'none');
    } else {
      var bottomcategory = $('.division3-container').eq(selected - 14);
      bottomcategory.css('display', 'block');
      bottomcategory.children('select').attr("value", "changed");
    }
    resetHTML();
    //オートバイ車体専用サイズ表示機能
    if (motorcycleSize.includes(selected)) {
      var size = $('.size-container').eq(9);
      size.css('display', 'block');
      size.children().children('select').attr("value", "changed");
    }
  });
  //--------------------------------------------------------------------
  //サイズ表示機能
  $('.division3').on('change', function () {
    resetHTML();
    var selected = Number($(this).val());

    if (adultWearSize.includes(selected)) {
      var size = $('.size-container').eq(0);
    } else if (childWearSize.includes(selected)) {
      var size = $('.size-container').eq(1);
    } else if (babyWearSize.includes(selected)) {
      var size = $('.size-container').eq(2);
    } else if (ladiesShoesSize.includes(selected)) {
      var size = $('.size-container').eq(3);
    } else if (mensShoesSize.includes(selected)) {
      var size = $('.size-container').eq(4);
    } else if (childShoesSize.includes(selected)) {
      var size = $('.size-container').eq(5);
    } else if (snowboardBoardSize.includes(selected)) {
      var size = $('.size-container').eq(6);
    } else if (skiBoardSize.includes(selected)) {
      var size = $('.size-container').eq(7);
    } else if (tireSize.includes(selected)) {
      var size = $('.size-container').eq(8);
    } else if (motorcycleHelmetSize.includes(selected)) {
      var size = $('.size-container').eq(10);
    } else if (tvSize.includes(selected)) {
      var size = $('.size-container').eq(11);
    }
    size.css('display', 'block');
    size.children().children('select').attr("value", "changed");
  })
  //--------------------------------------------------------------------
  //価格表示機能
  $('.price').on('change', function () {
    var priceval = $('.price').val();
    var price = Number(priceval) || 0;
    setPrice(price);
  })
  //--------------------------------------------------------------------
  //フォームの送信
  $('form').on('submit', function () {
    $('.division2:not([value="changed"])').parent().remove();
    $('.division3:not([value="changed"])').parent().remove();
    $('.size:not([value="changed"])').parent().parent().remove();
    $('.sell-upload-drop-box:last').remove();
  })
  //--------------------------------------------------------------------
  //検索フォームリセット
  $('#search_reset').on('click', function() {
    $('#search_form').attr('value', '');
    $('.search__form__head__price input').attr('value', '');
    $('#q_brand_id_eq option').attr('selected', false);
    $('#q_s option').attr('selected', false);
    $('.search__form__head__condition--boxes input').removeAttr('checked');
    $('.search__form__head__status--boxes input').removeAttr('checked');
  })
  //--------------------------------------------------------------------
  //詳細検索ページ・並び替えのセレクトボックスが変わったら自動的にソート
  $('#q_s').on('change', function() {
    var $form = $(this).parents('form');
    $form.submit();
  })
});