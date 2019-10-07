class PurchasesController < ApplicationController
  require 'payjp'
  require 'line/bot'
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
        # 商品ステータス変更処理
        @product.update(status_id: 4)
        # ポイント加算処理
        user = User.find(@product.seller_id)
        profit = (@product.price * 0.9).round(0)
        Point.create!(user_id: user.id, point: profit)
        # line-bot-api処理
        message = {
          type: 'text',
          text: "出品中の#{@product.name}が購入されました!"
        }
        client = Line::Bot::Client.new { |config|
          config.channel_secret = ENV['LINE_CHANNEL_SECRET']
          config.channel_token = ENV['LINE_CHANNEL_TOKEN']
        }
        user_id = user.line_token
        response = client.push_message(user_id, message)
        p response
        # ポイント減算処理
        if params[:point_button]
          Point.create!(user_id: current_user.id, point: -(@product.price))
        end
      else
        # エラー発生時
        redirect_to root_path, alert: 'エラーが発生しました'
      end
    else
      # 売り切れ時
      redirect_to root_path, alert: 'この商品は売り切れました'
    end
  end

  def pay_with_discount
    @purchase = Purchase.new(purchase_params)
    discounts_persentage = [-10, -7, -5, -3, 3, 5, 7, 10]
    @purchase[:discount] = discounts_persentage.sample.to_i
    #割引率をpurchaseテーブルに追加して保管させる->paramsに追加済み
    card = CreditCard.find_by(user_id: current_user.id)
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
    amount: (@product.price*(1 + @purchase.discount*0.01)+110).round(0), #支払金額を入力。割引率の追加
    customer: card.customer_id, #顧客ID
    currency: 'jpy', #日本円
    )
    
    if @product.status_id == 1
      if @purchase.save
        # 商品ステータス変更処理
        @product.update(status_id: 4)
        # ポイント加算処理withDiscount
        user = User.find(@product.seller_id)
        profit = (@product.price*(1+@purchase.discount*0.01) * 0.9).round(0) #割引率の追加
        Point.create!(user_id: user.id, point: profit)
        #line_bot_api処理の呼び出し
        message = {
          type: 'text',
          text: "出品中の#{@product.name}が購入されました!"
        }
        client = Line::Bot::Client.new { |config|
          config.channel_secret = ENV['LINE_CHANNEL_SECRET']
          config.channel_token = ENV['LINE_CHANNEL_TOKEN']
        }
        user_id = user.line_token
        response = client.push_message(user_id, message)
        p response
        
        # ポイント減算処理withDiscount
        if params[:point_button]
          Point.create!(user_id: current_user.id, point: -(@product.price*(1+@purchase.discount*0.01).round(0)))
        end
        redirect_to confirm_product_purchases_path(@product)
      else
        # エラー発生時
        redirect_to root_path, alert: 'エラーが発生しました'
      end
    else
      # 売り切れ時
      redirect_to root_path, alert: 'この商品は売り切れました'
    end
  end

  def confirm
    @purchase = Purchase.find_by(product_id: @product.id)
  end

  private

  def purchase_params
    params.require(:purchase).permit(:seller_id, :buyer_id, :product_id, :discount)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
  
end

