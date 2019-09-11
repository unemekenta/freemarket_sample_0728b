class PurchasesController < ApplicationController
  require 'payjp'
  before_action :set_product

  def new
    card = CreditCard.find_by(user_id: current_user.id)
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
      @address = current_user.deliveraddress
      @purchase = @product.purchases.build
    end
  end

  def pay
    card = CreditCard.find_by(user_id: current_user.id)
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
    amount: @product.price, #支払金額を入力
    customer: card.customer_id, #顧客ID
    currency: 'jpy', #日本円
    )
    @purchase = Purchase.new(purchase_params)
    if @product.status_id == 1
      if @purchase.save
        @product.update(status_id: 4)
        redirect_to action: 'done', notice: "商品を購入しました"
      else
        # エラー発生時
        redirect_to root_path, alert: 'エラーが発生しました'
      end
    else
      # 売り切れ時
      redirect_to root_path, alert: 'この商品は売り切れました'
    end
  end

  def done
    
  end


  private

  def purchase_params
    params.require(:purchase).permit(:seller_id, :buyer_id, :product_id)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end
