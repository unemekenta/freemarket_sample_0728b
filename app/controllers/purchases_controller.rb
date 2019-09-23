class PurchasesController < ApplicationController
  require 'payjp'
  before_action :set_product

  def new
    card = CreditCard.find_by(user_id: current_user.id)
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if card.blank?
      @address = current_user.deliveraddress
      @purchase = @product.purchases.build
    else
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
      @address = current_user.deliveraddress
      @purchase = @product.purchases.build
    end
    points = Point.where(user_id: current_user.id)
    @point = 0
    points.each do |po|
      @point += po.point
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
        if params[:buy_button]
          @product.update(status_id: 4)
          user = User.find(@product.seller_id)
          profit = (@product.price * 0.9).round(0)
          Point.create!(user_id: user.id, point: profit)
        else
          @product.update(status_id: 4)
          Point.create!(user_id: current_user.id, point: -(@product.price))
        end
        redirect_to action: 'done'
      else
        # エラー発生時
        redirect_to root_path, alert: 'エラーが発生しました'
      end
    else
      # 売り切れ時
      redirect_to root_path, alert: 'この商品は売り切れました'
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:seller_id, :buyer_id, :product_id)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
  
end
