$(document).on('turbolinks:load', function () {

  //DOMリセット用
  function resetHTML(num) {
    if (num === 1) {
      $('.brand').val("");
      $('.division2').val("");
      $('.division2-container').children('select').attr("value", "default");
      $('.division2-container').css('display', 'none');
      $('.division3-container').css('display', 'none');
    } else if (num === 2) {
      $('.division3').val("");
      $('.division3-container').children('select').attr("value", "default");
      $('.division3-container').css('display', 'none');
    } else {
      $('.size').val("");
      $('.size').children().children('select').attr("value", "default");
      $('.size-container').css('display', 'none');
    }
  }

  //サイズタイプ初期設定
  //引っ張ってくるidは暫定で手打ち
  //今後はcontroller, view, JSの順で取得したい。(自動化)
  //ここから
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

  var childWearSize = new Array();
  insertIds(childWearSize, 495, 534);

  var babyWearSize = new Array();
  insertIds(babyWearSize, 468, 494);

  var ladiesShoesSize = new Array();
  insertIds(ladiesShoesSize, 219, 228);

  var mensShoesSize = new Array();
  insertIds(mensShoesSize, 382, 389);

  var childShoesSize = new Array();
  insertIds(childShoesSize, 535, 539);

  var snowboardBoardSize = new Array();
  insertIds(snowboardBoardSize, 1000, 1001);

  var skiBoardSize = new Array();
  insertIds(skiBoardSize, 1002, 1003);

  var tireSize = new Array();
  insertIds(tireSize, 1004, 1005);

  var motorcycleSize = new Array();
  insertIds(motorcycleSize, 1006, 1007);

  var motorcycleHelmetSize = new Array();
  insertIds(motorcycleHelmetSize, 1008, 1009);
  //ここまで


  //カテゴリ表示機能 兼 ブランド表示機能
  $('.division1').on('change', function () {
    resetHTML(1);
    $('.size-container').css('display', 'none');
    var category = $(this).val();
    if (category === "") {
      $('.division2-container').css('display', 'none');
      $('.division3-container').css('display', 'none');
    } else {
      var middlecategory = $('.division2-container').eq(category - 1);
      middlecategory.css('display', 'block');
      middlecategory.children('select').attr("value", "changed");
      $('.brand-container').css('display', 'block');
    }
  });

  $('.division2').on('change', function () {
    resetHTML(2);
    $('.size-container').css('display', 'none');
    var category = $(this).val();
    if (category === "") {
      $('.division3-container').css('display', 'none');
    } else {
      var bottomcategory = $('.division3-container').eq(category - 14);
      bottomcategory.css('display', 'block');
      bottomcategory.children('select').attr("value", "changed");
    }
  });


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
    } else if (motorcycleSize.includes(selected)) {
      var size = $('.size-container').eq(9);
    } else if (motorcycleHelmetSize.includes(selected)) {
      var size = $('.size-container').eq(10);
    }
    size.css('display', 'block');
    size.children().children('select').attr("value", "changed");
  })

  //価格表示機能
  $('.price').on('change', function () {
    var price = Number($(this).val());
    var fee = (price * 0.1).toLocaleString();
    $('.fee').text(`¥${fee}`);
    var profit = (price - price * 0.1).toLocaleString();
    $('.profit').text(`¥${profit}`);
  })

  //フォームの送信
  $('form').on('submit', function () {
    $('.division2[value="default"]').parent().remove();
    $('.division3[value="default"]').parent().remove();
    $('.size[value="default"]').parent().parent().remove();
  })
});