document.addEventListener(
    "turbolinks:load", e => {
      if (document.getElementById("token_submit") != null) { 
        Payjp.setPublicKey("pk_test_4430f168d99e42958a284391"); //公開鍵
        let btn = document.getElementById("token_submit"); //IDがtoken_submitの場合に取得
        btn.addEventListener("click", e => { 
          e.preventDefault(); 
          let card = {
            number: document.getElementById("card_number").value,
            cvc: document.getElementById("cvc").value,
            exp_month: document.getElementById("exp_month").value,
            exp_year: document.getElementById("exp_year").value
          }; 
          Payjp.createToken(card, (status, response) => {
            if (status === 200) { //成功した場合
              $("#card_number").removeAttr("name");
              $("#cvc").removeAttr("name");
              $("#exp_month").removeAttr("name");
              $("#exp_year").removeAttr("name"); //データを自サーバにpostしないように削除
              $("#card_token").append(
                $('<input type="hidden" name="payjp-token">').val(response.id)
              ); 
              document.inputForm.submit();
              alert("登録が完了しました"); //確認用
            } else {
              alert("カード情報が正しくありません。"); //確認用
            }
          });
        });
      }
    },
    false
  );
